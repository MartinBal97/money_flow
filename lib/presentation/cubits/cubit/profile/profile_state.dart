part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileUser profileUser;

  ProfileSuccess(this.profileUser);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
