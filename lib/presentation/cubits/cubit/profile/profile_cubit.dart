import 'package:bloc/bloc.dart';
import 'package:my_pocket/domain/entities/profile_user.dart';
import 'package:my_pocket/domain/repository/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());

      final ProfileUser? user = await profileRepo.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoaded(user));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String uid,
    String? newName,
    String? newProfileImageUrl,
    int? newXp,
  }) async {
    try {
      emit(ProfileLoading());

      final ProfileUser? currentUser = await profileRepo.fetchUserProfile(uid);

      if (currentUser != null) {
        final ProfileUser updatedProfile = currentUser.copyWith(
          name: newName ?? currentUser.name,
          profileImageUrl: newProfileImageUrl ?? currentUser.profileImageUrl,
          xp: currentUser.xp + (newXp ?? 0),
        );

        await profileRepo.updateProfile(updatedProfile);

        await fetchUserProfile(uid);

        emit(ProfileLoaded(updatedProfile));
      } else {
        emit(ProfileError('User not found'));
        return;
      }
    } catch (e) {
      emit(ProfileError('Error updating profile $e'));
    }
  }
}
