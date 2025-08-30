import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  AuthRepository authRepository;
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  static ForgetPasswordCubit get(BuildContext context) =>
      BlocProvider.of<ForgetPasswordCubit>(context);

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      emit(
        ForgetPasswordFailure(
          errorMessage: 'Please fix the errors before proceeding.',
        ),
      );
      return;
    }
    try {
      await authRepository.forgetPassword(email: emailController.text.trim());
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(errorMessage: _errorToMessage(e)));
    }
  }

  String _errorToMessage(dynamic e) {
    if (e.toString().contains('user-not-found')) {
      return 'No user found with this email.';
    } else if (e.toString().contains('invalid-email')) {
      return 'The email address is not valid.';
    } else {
      return 'Something went wrong. Please try again later.';
    }
  }
}
