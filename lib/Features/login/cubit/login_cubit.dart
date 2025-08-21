import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/Features/login/data/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginValidationError());
      return;
    }

    emit(LoginLoading());

    try {
      final user = await loginRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        emit(LoginSuccess(user.uid));
      } else {
        emit(LoginFailure('User not found.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(_getErrorMessage(e)));
    } catch (e) {
      emit(LoginFailure('Unexpected error: ${e.toString()}'));
    }
  }

  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'invalid-email':
        return 'Invalid email address.';
      default:
        return e.message ?? 'Authentication error.';
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
