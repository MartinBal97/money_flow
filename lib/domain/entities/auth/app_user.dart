enum AccountType { cash, card }

class AppUser {
  final String uid;
  final String email;
  final String? name;
  final String? badge;
  final AccountType? accountType;

  AppUser({
    required this.uid,
    required this.email,
    this.name,
    this.badge,
    this.accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'badge': badge,
      'accountType': accountType,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'],
      email: jsonUser['email'],
      name: jsonUser['name'],
      badge: jsonUser['badge'],
      accountType: jsonUser['accountType'],
    );
  }
}
