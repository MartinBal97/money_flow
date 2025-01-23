import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pocket/domain/entities/app_user.dart';
import 'package:my_pocket/domain/repository/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email, name: null);

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String email, String password, String name) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email, name: name);

      firebaseFirestore.collection('users').doc(user.uid).set(user.toJson());

      return user;
    } catch (e) {
      log(e.toString());
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
