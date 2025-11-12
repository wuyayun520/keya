import 'package:flutter/material.dart';
import '../models/workout_post.dart';
import '../widgets/workout_post_card.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WorkoutPost> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() {
    setState(() {
      _posts.addAll([
        WorkoutPost(
          id: '1',
          userId: 'user1',
          userName: 'Sarah Johnson',
          userAvatar: '',
          content: 'Just finished an amazing morning run! Feeling energized and ready for the day. Remember, consistency is key! 💪',
          images: [],
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          likes: 24,
          comments: 5,
          tags: ['running', 'morning', 'motivation'],
          workoutType: 'Running',
          duration: 30,
          calories: 250,
        ),
        WorkoutPost(
          id: '2',
          userId: 'user2',
          userName: 'Mike Chen',
          userAvatar: '',
          content: 'New personal record in the gym today! Deadlift 180kg x 3 reps. Hard work pays off! 🔥',
          images: [],
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          likes: 89,
          comments: 12,
          tags: ['strength', 'gym', 'progress'],
          workoutType: 'Strength Training',
          duration: 60,
          calories: 450,
        ),
        WorkoutPost(
          id: '3',
          userId: 'user3',
          userName: 'Emma Wilson',
          userAvatar: '',
          content: 'Yoga session in the park. Perfect weather and great vibes! Namaste 🙏',
          images: [],
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          likes: 42,
          comments: 8,
          tags: ['yoga', 'outdoor', 'mindfulness'],
          workoutType: 'Yoga',
          duration: 45,
          calories: 180,
        ),
        WorkoutPost(
          id: '4',
          userId: 'user4',
          userName: 'David Martinez',
          userAvatar: '',
          content: 'Cycling through the city trails. 25km done! The sunset view was incredible today.',
          images: [],
          createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
          likes: 67,
          comments: 15,
          tags: ['cycling', 'outdoor', 'endurance'],
          workoutType: 'Cycling',
          duration: 90,
          calories: 520,
        ),
        WorkoutPost(
          id: '5',
          userId: 'user5',
          userName: 'Lisa Anderson',
          userAvatar: '',
          content: 'Swimming laps at the pool. Water therapy is the best! 2km completed.',
          images: [],
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          likes: 35,
          comments: 6,
          tags: ['swimming', 'cardio', 'recovery'],
          workoutType: 'Swimming',
          duration: 40,
          calories: 320,
        ),
      ]);
    });
  }

  void _handleLike(String postId) {
    setState(() {
      final index = _posts.indexWhere((post) => post.id == postId);
      if (index != -1) {
        _posts[index] = _posts[index].copyWith(likes: _posts[index].likes + 1);
      }
    });
  }

  void _handleComment(String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Comment feature coming soon!')),
    );
  }

  void _handleShare(String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming soon!')),
    );
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
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  AppTheme.appName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Search feature coming soon!')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notifications feature coming soon!')),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: _posts.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primaryColor,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          _loadPosts();
                        },
                        color: AppTheme.primaryColor,
                        child: ListView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (context, index) {
                            final post = _posts[index];
                            return WorkoutPostCard(
                              post: post,
                              onLike: () => _handleLike(post.id),
                              onComment: () => _handleComment(post.id),
                              onShare: () => _handleShare(post.id),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create post feature coming soon!')),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

