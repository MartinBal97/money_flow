import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pocket/domain/entities/profile_user.dart';
import 'package:my_pocket/domain/repository/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {
      final userDoc = await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final Map<String, dynamic>? user = userDoc.data();

        if (user != null) {
          return ProfileUser.fromJson(user);
        }
      }

      return null;
    } catch (e) {
      throw Exception('Error fetching user profile');
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      await _firestore.collection('users').doc(updatedProfile.uid).update({
        'name': updatedProfile.name,
        'profileImageUrl': updatedProfile.profileImageUrl,
        'xp': updatedProfile.xp,
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
