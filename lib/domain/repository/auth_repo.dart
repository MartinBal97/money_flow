import 'package:my_pocket/domain/entities/auth/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(String email, String password);
  Future<AppUser?> getCurrentUser();
  Future<void> logOut();
}
