import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import 'user_profile_screen.dart';
import 'keya_wallet_screen.dart';
import '../theme/app_theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<UserData> _topUsers = [];
  List<UserData> _allUsers = [];
  List<UserData> _remainingUsers = [];
  bool _isLoading = true;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  Set<String> _unlockedUserIds = {}; // Cache unlocked user IDs in memory
  
  static const int _unlockCost = 58; // Cost to unlock a user in diamonds

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _loadUnlockedUsers();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadUsers() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/PerMarginCon/users_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final UsersDataResponse response = UsersDataResponse.fromJson(jsonData);
      
      setState(() {
        _allUsers = response.users;
        _topUsers = response.users.take(4).toList();
        _remainingUsers = response.users.skip(4).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToRandomUser() {
    if (_allUsers.isEmpty) return;
    
    final random = DateTime.now().millisecondsSinceEpoch;
    final randomIndex = random % _allUsers.length;
    final randomUser = _allUsers[randomIndex];
    
    _handleUserTap(randomUser);
  }

  Future<void> _loadUnlockedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final unlockedUsers = prefs.getStringList('unlockedUsers') ?? [];
    setState(() {
      _unlockedUserIds = unlockedUsers.toSet();
    });
  }

  Future<int> _getKeyaDiamondsBalance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('keyaDiamonds') ?? 0;
  }

  bool _isUserUnlocked(String userId) {
    return _unlockedUserIds.contains(userId);
  }

  Future<void> _unlockUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final unlockedUsers = prefs.getStringList('unlockedUsers') ?? [];
    if (!unlockedUsers.contains(userId)) {
      unlockedUsers.add(userId);
      await prefs.setStringList('unlockedUsers', unlockedUsers);
    }
    // Update memory cache and trigger rebuild
    setState(() {
      _unlockedUserIds.add(userId);
    });
  }

  Future<bool> _consumeDiamonds(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final currentBalance = prefs.getInt('keyaDiamonds') ?? 0;
    
    if (currentBalance >= amount) {
      final newBalance = currentBalance - amount;
      await prefs.setInt('keyaDiamonds', newBalance);
      return true;
    }
    return false;
  }

  Future<void> _handleUserTap(UserData user) async {
    // Check if user is already unlocked
    final isUnlocked = _isUserUnlocked(user.userId);
    
    if (isUnlocked) {
      // User is already unlocked, navigate directly
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserProfileScreen(user: user),
        ),
      );
      return;
    }

    // Get current diamond balance
    final balance = await _getKeyaDiamondsBalance();
    
    // Check if user has enough diamonds
    if (balance >= _unlockCost) {
      // Show confirmation dialog
      final shouldUnlock = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text(
              'Unlock User',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Unlock this user for $_unlockCost Keya Diamonds?',
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Unlock',
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ),
            ],
          );
        },
      );

      if (shouldUnlock == true) {
        // Consume diamonds and unlock user
        final success = await _consumeDiamonds(_unlockCost);
        
        if (success) {
          await _unlockUser(user.userId);
          
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User unlocked! -$_unlockCost Keya Diamonds'),
                backgroundColor: AppTheme.primaryColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
          
          // Navigate to user profile
          if (mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(user: user),
              ),
            );
          }
        }
      }
    } else {
      // Not enough diamonds, show dialog to go to wallet
      final shouldGoToWallet = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text(
              'Insufficient Diamonds',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'You need $_unlockCost Keya Diamonds to unlock this user.\n\nYour balance: $balance\nRequired: $_unlockCost\n\nGo to Wallet to recharge?',
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Go to Wallet',
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ),
            ],
          );
        },
      );

      if (shouldGoToWallet == true && mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WalletScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 20),
                  child: SizedBox(
                    width: 197,
                    height: 24,
                    child: Image.asset(
                      'assets/keya_home_recommend.webp',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _topUsers.map((user) {
                            return _buildUserAvatar(user);
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _navigateToRandomUser,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 175,
                            child: Image.asset(
                              'assets/keya_home_topic.webp',
                              fit: BoxFit.fill,
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
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 197,
                          height: 24,
                          child: Image.asset(
                            'assets/keya_home_post.webp',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (_remainingUsers.isNotEmpty) ...[
                        SizedBox(
                          height: 400,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _remainingUsers.length,
                            itemBuilder: (context, index) {
                              final user = _remainingUsers[index];
                              return _buildUserCard(user);
                            },
                          ),
                        ),
                      ],
                      const SizedBox(height: 100),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAvatar(UserData user) {
    final isUnlocked = _isUserUnlocked(user.userId);
    
    return GestureDetector(
      onTap: () {
        _handleUserTap(user);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFEF364F),
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    user.avatarBGPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (!isUnlocked)
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            user.firstName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (!isUnlocked)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: Image.asset(
                    'assets/keya_diamond.webp',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.diamond,
                        color: Colors.amber,
                        size: 12,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '$_unlockCost',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildUserCard(UserData user) {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final timeStamp = '$hour:$minute';
    final isUnlocked = _isUserUnlocked(user.userId);

    return GestureDetector(
      onTap: () {
        _handleUserTap(user);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
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
              // Gradient overlay
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
              // Lock icon in top right corner
              if (!isUnlocked)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.9),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
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
                                  child: const Icon(Icons.person, color: Colors.white, size: 20),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.displayName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                timeStamp,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Post title
                    Text(
                      user.postTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Unlock price badge at bottom
                    if (!isUnlocked) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset(
                                'assets/keya_diamond.webp',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.diamond,
                                    color: Colors.amber,
                                    size: 16,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '$_unlockCost to unlock',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
