import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../theme/app_theme.dart';
import 'keya_chat_screen.dart';

class UserProfileScreen extends StatefulWidget {
  final UserData user;

  const UserProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isFollowing = false;
  bool _isBlocked = false;

  @override
  void initState() {
    super.initState();
    _loadFollowStatus();
    _loadBlockStatus();
  }

  Future<void> _loadFollowStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'follow_${widget.user.userId}';
      final isFollowing = prefs.getBool(key) ?? false;
      setState(() {
        _isFollowing = isFollowing;
      });
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _saveFollowStatus(bool isFollowing) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'follow_${widget.user.userId}';
      await prefs.setBool(key, isFollowing);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _loadBlockStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'block_${widget.user.userId}';
      final isBlocked = prefs.getBool(key) ?? false;
      setState(() {
        _isBlocked = isBlocked;
      });
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _saveBlockStatus(bool isBlocked) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'block_${widget.user.userId}';
      await prefs.setBool(key, isBlocked);
    } catch (e) {
      // Handle error silently
    }
  }

  void _showBlockDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Block User',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Are you sure you want to block ${widget.user.displayName}? You won\'t see their content anymore.',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _saveBlockStatus(true);
                setState(() {
                  _isBlocked = true;
                });
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User has been blocked'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Block', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showReportDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Report User',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Thank you for your report. We will review it shortly.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Report submitted successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _showUnblockDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Unblock User',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Are you sure you want to unblock ${widget.user.displayName}?',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _saveBlockStatus(false);
                setState(() {
                  _isBlocked = false;
                });
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User has been unblocked'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('Unblock', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/keya_allbg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
                      color: Colors.grey[900],
                      onSelected: (value) {
                        if (value == 'block') {
                          _showBlockDialog();
                        } else if (value == 'unblock') {
                          _showUnblockDialog();
                        } else if (value == 'report') {
                          _showReportDialog();
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          value: _isBlocked ? 'unblock' : 'block',
                          child: Row(
                            children: [
                              Icon(
                                _isBlocked ? Icons.person_remove : Icons.block,
                                color: _isBlocked ? Colors.green : Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _isBlocked ? 'Unblock User' : 'Block User',
                                style: TextStyle(
                                  color: _isBlocked ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'report',
                          child: const Row(
                            children: [
                              Icon(Icons.flag, color: Colors.orange, size: 20),
                              SizedBox(width: 12),
                              Text(
                                'Report User',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _isBlocked
                    ? _buildBlockedView()
                    : SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            // Cover Image with Follow Button
                            _buildCoverSection(),
                            const SizedBox(height: 16),
                            // User Info Card
                            _buildUserInfoCard(),
                            const SizedBox(height: 16),
                            // Fitness Data Card
                            _buildFitnessDataCard(),
                            const SizedBox(height: 16),
                            // Posts Section
                            _buildPostsSection(),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlockedView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.block,
              size: 80,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 24),
            Text(
              'This user has been blocked',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'You won\'t see their content. You can unblock them from the menu.',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            height: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(widget.user.coverPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () async {
                final newStatus = !_isFollowing;
                setState(() {
                  _isFollowing = newStatus;
                });
                await _saveFollowStatus(newStatus);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _isFollowing
                        ? [Colors.grey.shade400, Colors.grey.shade500]
                        : [Colors.purple.shade300, Colors.purple.shade400],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _isFollowing ? 'Following' : 'Follow',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage('assets/keya_profile_card.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage(widget.user.avatarPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.user.displayName} ${widget.user.experienceYears}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.user.workoutType.split(' ').first,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Cardio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Action Buttons
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => KeyaChatScreen(
                      userId: widget.user.userId,
                      userName: widget.user.displayName,
                      userAvatar: widget.user.avatarPath,
                    ),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/keya_profile_chat.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.message, color: Colors.white, size: 24),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFitnessDataCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage('assets/keya_profile_fitnessdata.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Container(
             
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${widget.user.weeklyWorkouts}.5hours',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Post 1
          _buildPostCard(
            title: widget.user.postTitle,
            tag: widget.user.workoutType,
            imagePath: widget.user.coverPath,
            isFavorite: true,
          ),
          const SizedBox(height: 16),
          // Post 2
          _buildPostCard(
            title: 'Working out at home saves me...',
            tag: widget.user.workoutType,
            imagePath: widget.user.avatarBGPath,
            isFavorite: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard({
    required String title,
    required String tag,
    required String imagePath,
    required bool isFavorite,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Post Image
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Post Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag.split(' ').first,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Favorite Button
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isFavorite ? Colors.amber : Colors.red.shade900,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

