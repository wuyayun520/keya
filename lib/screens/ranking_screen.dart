import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import 'video_player_screen.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  List<UserData> _rankedUsers = [];
  bool _isLoading = true;
  Map<String, bool> _likedUsers = {}; // 存储用户点赞状态
  Map<String, int> _likeCounts = {}; // 存储用户点赞数量

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/PerMarginCon/users_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final UsersDataResponse response = UsersDataResponse.fromJson(jsonData);
      
      // 获取被隐藏的视频列表
      final prefs = await SharedPreferences.getInstance();
      final hiddenVideosJson = prefs.getString('hidden_videos');
      List<String> hiddenVideos = [];
      if (hiddenVideosJson != null) {
        hiddenVideos = List<String>.from(json.decode(hiddenVideosJson));
      }
      
      // 获取点赞数据
      final likedUsersJson = prefs.getString('liked_users');
      final likeCountsJson = prefs.getString('like_counts');
      
      Map<String, bool> likedUsers = {};
      Map<String, int> likeCounts = {};
      
      if (likedUsersJson != null) {
        final likedMap = json.decode(likedUsersJson) as Map<String, dynamic>;
        likedUsers = likedMap.map((key, value) => MapEntry(key, value as bool));
      }
      
      if (likeCountsJson != null) {
        final countsMap = json.decode(likeCountsJson) as Map<String, dynamic>;
        likeCounts = countsMap.map((key, value) => MapEntry(key, value as int));
      }
      
      // 过滤掉被隐藏的用户
      final filteredUsers = response.users
          .where((user) => !hiddenVideos.contains(user.userId))
          .toList();
      
      // 按 experienceYears 排序
      final sortedUsers = filteredUsers.toList()
        ..sort((a, b) => b.experienceYears.compareTo(a.experienceYears));
      
      // 初始化点赞数据（如果用户没有本地数据，使用原始数据）
      for (final user in sortedUsers) {
        if (!likedUsers.containsKey(user.userId)) {
          likedUsers[user.userId] = false;
        }
        if (!likeCounts.containsKey(user.userId)) {
          likeCounts[user.userId] = user.likes;
        }
      }
      
      setState(() {
        _rankedUsers = sortedUsers;
        _likedUsers = likedUsers;
        _likeCounts = likeCounts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleLike(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLiked = _likedUsers[userId] ?? false;
      final currentCount = _likeCounts[userId] ?? 0;
      
      // 更新状态
      setState(() {
        _likedUsers[userId] = !isLiked;
        _likeCounts[userId] = isLiked ? currentCount - 1 : currentCount + 1;
      });
      
      // 保存到本地
      await prefs.setString('liked_users', json.encode(_likedUsers));
      await prefs.setString('like_counts', json.encode(_likeCounts));
    } catch (e) {
      debugPrint('Error toggling like: $e');
    }
  }

  String _getTopBadgeImage(int rank) {
    switch (rank) {
      case 1:
        return 'assets/keya_ranking_top_one.webp';
      case 2:
        return 'assets/keya_ranking_top_two.webp';
      case 3:
        return 'assets/keya_ranking_top_three.webp';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/keya_allbg.webp',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.black);
              },
            ),
          ),
          Column(
            children: [
              // Ranking Image
              SizedBox(
                width: double.infinity,
                height: 244,
                child: Image.asset(
                  'assets/keya_ranking.webp',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 40),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 100, top: 16),
                        child: Column(
                          children: _rankedUsers.asMap().entries.map((entry) {
                            final index = entry.key;
                            final user = entry.value;
                            final rank = index + 1;
                            return _buildRankingCard(user, rank);
                          }).toList(),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRankingCard(UserData user, int rank) {
    final isTopThree = rank <= 3;
    final isLiked = _likedUsers[user.userId] ?? false;
    
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              videoPath: user.videoPath,
              userName: user.firstName,
              userId: user.userId,
            ),
          ),
        );
        // 如果视频被隐藏，重新加载列表
        if (result == true) {
          _loadUsers();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Cover Image
              Image.asset(
                user.coverPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                    ),
                  );
                },
              ),
              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Like Icon and Top Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Like Icon
                        GestureDetector(
                          onTap: () => _toggleLike(user.userId),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? const Color(0xFFEF364F) : Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        // Top Badge
                        if (isTopThree)
                          Image.asset(
                            _getTopBadgeImage(rank),
                            width: 80,
                            height: 40,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Top ${rank.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                    const Spacer(),
                    // Bottom Row: Avatar, Name, Days
                    Row(
                      children: [
                        // Avatar
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              user.avatarPath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey,
                                  child: const Icon(Icons.person, color: Colors.white, size: 30),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Name and Days
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                user.firstName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Lasted for ${user.experienceYears * 36} days',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
