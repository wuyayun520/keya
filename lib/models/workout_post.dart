class WorkoutPost {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String content;
  final List<String> images;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final List<String> tags;
  final String? workoutType;
  final int? duration;
  final double? calories;

  WorkoutPost({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.images,
    required this.createdAt,
    this.likes = 0,
    this.comments = 0,
    this.tags = const [],
    this.workoutType,
    this.duration,
    this.calories,
  });

  WorkoutPost copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userAvatar,
    String? content,
    List<String>? images,
    DateTime? createdAt,
    int? likes,
    int? comments,
    List<String>? tags,
    String? workoutType,
    int? duration,
    double? calories,
  }) {
    return WorkoutPost(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      content: content ?? this.content,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      tags: tags ?? this.tags,
      workoutType: workoutType ?? this.workoutType,
      duration: duration ?? this.duration,
      calories: calories ?? this.calories,
    );
  }
}

