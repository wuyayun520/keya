class UserData {
  final String userId;
  final String username;
  final String displayName;
  final String bio;
  final String fitnessLevel;
  final int experienceYears;
  final List<String> fitnessGoals;
  final int weeklyWorkouts;
  final List<String> favoriteExercises;
  final List<String> achievements;
  final String gymLocation;
  final String avatarPath;
  final String avatarBGPath;
  final String coverPath;
  final String videoPath;
  final String postTitle;
  final String postContent;
  final String workoutType;
  final List<String> tags;
  final int likes;
  final int comments;
  final int shares;

  UserData({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.bio,
    required this.fitnessLevel,
    required this.experienceYears,
    required this.fitnessGoals,
    required this.weeklyWorkouts,
    required this.favoriteExercises,
    required this.achievements,
    required this.gymLocation,
    required this.avatarPath,
    required this.avatarBGPath,
    required this.coverPath,
    required this.videoPath,
    required this.postTitle,
    required this.postContent,
    required this.workoutType,
    required this.tags,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      bio: json['bio'] as String,
      fitnessLevel: json['fitnessLevel'] as String,
      experienceYears: json['experienceYears'] as int,
      fitnessGoals: List<String>.from(json['fitnessGoals'] as List),
      weeklyWorkouts: json['weeklyWorkouts'] as int,
      favoriteExercises: List<String>.from(json['favoriteExercises'] as List),
      achievements: List<String>.from(json['achievements'] as List),
      gymLocation: json['gymLocation'] as String,
      avatarPath: json['avatar']['path'] as String,
      avatarBGPath: json['avatarBG']['path'] as String,
      coverPath: json['cover']['path'] as String,
      videoPath: json['video']['path'] as String,
      postTitle: json['postTitle'] as String,
      postContent: json['postContent'] as String,
      workoutType: json['workoutType'] as String,
      tags: List<String>.from(json['tags'] as List),
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      shares: json['shares'] as int,
    );
  }

  // Extract first name from display name
  String get firstName {
    return displayName.split(' ').first;
  }
}

class UsersDataResponse {
  final String version;
  final int totalUsers;
  final List<UserData> users;

  UsersDataResponse({
    required this.version,
    required this.totalUsers,
    required this.users,
  });

  factory UsersDataResponse.fromJson(Map<String, dynamic> json) {
    return UsersDataResponse(
      version: json['version'] as String,
      totalUsers: json['totalUsers'] as int,
      users: (json['users'] as List)
          .map((userJson) => UserData.fromJson(userJson as Map<String, dynamic>))
          .toList(),
    );
  }
}

