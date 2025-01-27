import 'package:my_pocket/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String profileImageUrl;
  final int xp;

  ProfileUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.profileImageUrl,
    this.xp = 0,
  });

  ProfileUser copyWith({String? name, String? profileImageUrl, int? xp}) {
    return ProfileUser(
      uid: uid,
      email: email,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      xp: xp ?? this.xp,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'xp': xp,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory ProfileUser.fromJson(Map<String, dynamic> jsonUser) {
    return ProfileUser(
      uid: jsonUser['uid'] as String,
      email: jsonUser['email'] as String,
      name: jsonUser['name'] as String,
      xp: jsonUser['xp'] as int? ?? 0,
      profileImageUrl: jsonUser['profileImageUrl']?.toString() ?? '',
    );
  }
}
