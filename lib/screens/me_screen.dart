import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import 'privacy_policy_screen.dart';
import 'terms_of_service_screen.dart';
import 'about_screen.dart';
import 'keya_wallet_screen.dart';
import 'keya_vip_screen.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  String _avatarFileName = 'profile_avatar.jpg';
  String? _avatarPath;
  String _userName = 'Molly';
  String _bio = 'Fitness has given me a second life';
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userName = prefs.getString('user_name');
      final bio = prefs.getString('user_bio');
      final avatarFileName = prefs.getString('avatar_file_name') ?? 'profile_avatar.jpg';

      if (userName != null) {
        setState(() {
          _userName = userName;
        });
      }

      if (bio != null) {
        setState(() {
          _bio = bio;
        });
      }

      setState(() {
        _avatarFileName = avatarFileName;
      });

      // Load avatar path
      await _loadAvatarPath();
    } catch (e) {
      debugPrint('Error loading profile data: $e');
    }
  }

  Future<void> _loadAvatarPath() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final avatarFile = File('${dir.path}/$_avatarFileName');
      if (await avatarFile.exists()) {
        setState(() {
          _avatarPath = avatarFile.path;
        });
      }
    } catch (e) {
      debugPrint('Error loading avatar path: $e');
    }
  }

  Future<void> _saveProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', _userName);
      await prefs.setString('user_bio', _bio);
      await prefs.setString('avatar_file_name', _avatarFileName);
    } catch (e) {
      debugPrint('Error saving profile data: $e');
    }
  }

  Future<bool> _checkVipStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isVip = prefs.getBool('keyaIsVip') ?? false;
    
    if (!isVip) {
      final expiryStr = prefs.getString('keyaVipExpiry');
      if (expiryStr != null) {
        final expiry = DateTime.tryParse(expiryStr);
        if (expiry != null && expiry.isAfter(DateTime.now())) {
          // VIP not expired
          return true;
        }
      }
      return false;
    }
    
    // Check if VIP is expired
    final expiryStr = prefs.getString('keyaVipExpiry');
    if (expiryStr != null) {
      final expiry = DateTime.tryParse(expiryStr);
      if (expiry != null && expiry.isBefore(DateTime.now())) {
        // VIP expired
        await prefs.setBool('keyaIsVip', false);
        return false;
      }
    }
    
    return isVip;
  }

  Future<bool> _showVipRequiredDialog(String action) async {
    final shouldGoToVip = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'VIP Required',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'This feature requires Keya Premium membership.\n\nGo to VIP Center to subscribe?',
            style: TextStyle(color: Colors.white70),
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
                'Go to VIP',
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            ),
          ],
        );
      },
    );

    if (shouldGoToVip == true && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const VipScreen(),
        ),
      );
    }

    return shouldGoToVip == true;
  }

  Future<void> _pickAvatar() async {
    // Check VIP status before picking avatar
    final isVip = await _checkVipStatus();
    
    if (!isVip) {
      await _showVipRequiredDialog('modify avatar');
      return;
    }

    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (picked != null) {
        final dir = await getApplicationDocumentsDirectory();
        final avatarFile = File('${dir.path}/$_avatarFileName');
        await File(picked.path).copy(avatarFile.path);

        setState(() {
          _avatarPath = avatarFile.path;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Avatar updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _editUserName() async {
    final TextEditingController controller = TextEditingController(text: _userName);
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Edit Name',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.red),
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              hintStyle: TextStyle(color: Colors.red),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text.trim()),
              child: const Text('Save', style: TextStyle(color: AppTheme.primaryColor)),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _userName = result;
      });
      await _saveProfileData();
    }
  }

  Future<void> _editBio() async {
    final TextEditingController controller = TextEditingController(text: _bio);
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Edit Bio',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.red),
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Enter your bio',
              hintStyle: TextStyle(color: Colors.white70),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text.trim()),
              child: const Text('Save', style: TextStyle(color: AppTheme.primaryColor)),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _bio = result;
      });
      await _saveProfileData();
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
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Profile Header
                _buildProfileHeader(),
                const SizedBox(height: 32),
                // VIP Club
                _buildVIPCard(),
                const SizedBox(height: 16),
                // Wallet
                _buildWalletCard(),
                const SizedBox(height: 24),
                // Common Functions
                _buildCommonFunctions(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        // Follower counts and Avatar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left: Followers
            Expanded(
              child: Column(
                children: [
                  const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Followers',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Center: Avatar
            GestureDetector(
              onTap: _pickAvatar,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: _avatarPath != null && File(_avatarPath!).existsSync()
                      ? Image.file(
                          File(_avatarPath!),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppTheme.primaryColor.withOpacity(0.3),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 60,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                ),
              ),
            ),
            // Right: Follower
            Expanded(
              child: Column(
                children: [
                  const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Follower',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // User Name
        GestureDetector(
          onTap: _editUserName,
          child: Text(
            _userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Bio
        GestureDetector(
          onTap: _editBio,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _bio,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVIPCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VipScreen(),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/keya_me_vip.webp',
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'VIP Club',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWalletCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WalletScreen(),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/keya_me_wallet.webp',
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCommonFunctions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Common Functions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 12),
          _buildFunctionItem(
            iconImage: 'assets/keya_me_1.webp',
            title: 'Privacy Policy',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildFunctionItem(
            iconImage: 'assets/keya_me_2.webp',
            title: 'User Agreement',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TermsOfServiceScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildFunctionItem(
            iconImage: 'assets/keya_me_3.webp',
            title: 'About us',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionItem({
    IconData? icon,
    IconData? iconChild,
    String? iconImage,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (iconImage != null)
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  iconImage,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      icon ?? Icons.error_outline,
                      color: Colors.white,
                      size: 40,
                    );
                  },
                ),
              )
            else if (iconChild != null)
              Stack(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        iconChild,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              )
            else if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/keya_me_4.webp',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.chevron_right,
                    color: Colors.white70,
                    size: 24,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
