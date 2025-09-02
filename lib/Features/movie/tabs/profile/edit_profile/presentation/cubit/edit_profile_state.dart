part of 'edit_profile_cubit.dart';

sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileSuccess extends EditProfileState {}
final class EditProfileFailure extends EditProfileState {
  final String errorMessage ;

  EditProfileFailure(this.errorMessage);
}
final class DeleteProfileLoading extends EditProfileState {}
final class DeleteProfileSuccess extends EditProfileState {}
final class DeleteProfileFailure extends EditProfileState {
  final String errorMessage ;

  DeleteProfileFailure(this.errorMessage);
}
