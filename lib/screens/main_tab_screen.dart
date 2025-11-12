import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'record_screen.dart';
import 'ranking_screen.dart';
import 'me_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ExploreScreen(),
    const RecordScreen(),
    const RankingScreen(),
    const MeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 16,
            child: SafeArea(
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(
                      index: 0,
                      unselectedImage: 'assets/tab/keya_tab_explore_1.webp',
                      selectedImage: 'assets/tab/keya_tab_explore_selete_1.webp',
                    ),
                    _buildTabItem(
                      index: 1,
                      unselectedImage: 'assets/tab/keya_tab_record_2.webp',
                      selectedImage: 'assets/tab/keya_tab_explore_selete_2.webp',
                    ),
                    _buildTabItem(
                      index: 2,
                      unselectedImage: 'assets/tab/keya_tab_ranking_3.webp',
                      selectedImage: 'assets/tab/keya_tab_explore_selete_3.webp',
                    ),
                    _buildTabItem(
                      index: 3,
                      unselectedImage: 'assets/tab/keya_tab_me_4.webp',
                      selectedImage: 'assets/tab/keya_tab_explore_selete_4.webp',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String unselectedImage,
    required String selectedImage,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: 60,
        height: 60,
     
        child: Center(
          child: Image.asset(
            isSelected ? selectedImage : unselectedImage,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                _getIconForIndex(index),
                color: Colors.white,
                size: 28,
              );
            },
          ),
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.explore;
      case 1:
        return Icons.fiber_manual_record;
      case 2:
        return Icons.emoji_events;
      case 3:
        return Icons.person;
      default:
        return Icons.circle;
    }
  }
}

