import 'package:my_pocket/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(String email, String password, String name);
  Future<AppUser?> getCurrentUser();
  Future<void> logOut();
}
