part of 'register_cubit.dart';

@immutable
sealed class RegisterState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserModel userModel ;

  RegisterSuccess(this.userModel);
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

final class RegisterValidationError extends RegisterState {}
final class RegisterSelectProfileImage extends RegisterState {}
