import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pocket/domain/entities/auth/app_user.dart';
import 'package:my_pocket/domain/repository/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email, name: '');

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email, name: '');

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final User? user = firebaseAuth.currentUser;

    if (user == null) {
      return null;
    } else {
      return AppUser(
        uid: user.uid,
        email: user.email!,
      );
    }
  }
}
