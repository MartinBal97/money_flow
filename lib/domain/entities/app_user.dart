class AppUser {
  final String uid;
  final String email;
  final String? name;

  AppUser({
    required this.uid,
    required this.email,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'] as String,
      email: jsonUser['email'] as String,
      name: jsonUser['name'] as String?,
    );
  }
}
