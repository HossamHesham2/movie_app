part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginValidationError extends LoginState {}

final class LoginSuccess extends LoginState {
  final String? uid;

  LoginSuccess(this.uid);
}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

final class LoginWithGoogleFailure extends LoginState {
  final String errMessage;

  LoginWithGoogleFailure(this.errMessage);
}

final class LoginWithGoogleLoading extends LoginState {}
final class SignOutWithGoogleLoading extends LoginState {}
final class SignOutWithGoogleSuccess extends LoginState {}

final class LoginWithGoogleSuccess extends LoginState {
  final String? uid;

  LoginWithGoogleSuccess(this.uid);
}
