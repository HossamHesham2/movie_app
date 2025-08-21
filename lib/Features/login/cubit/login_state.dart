part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}
final class LoginValidationError extends LoginState {}

final class LoginSuccess extends LoginState {
  final String? uid;

  LoginSuccess(this.uid);

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}
