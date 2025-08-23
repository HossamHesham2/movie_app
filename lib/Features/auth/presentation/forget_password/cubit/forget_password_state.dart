part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
