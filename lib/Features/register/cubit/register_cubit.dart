import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/Features/register/data/repositories/register_repository.dart';
import 'package:movie_app/core/models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterCubit(this.registerRepository) : super(RegisterInitial());
  UserModel? userModel;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? profileImage;

  static RegisterCubit get(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);

  void selectProfileImage({required String image}) {
    profileImage = image;
    emit(RegisterSelectProfileImage());
  }

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) {
      autovalidateMode = AutovalidateMode.always;
      emit(RegisterValidationError());
    }

    emit(RegisterLoading());
    try {
      final user = await registerRepository.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (user == null) {
        emit(RegisterFailure('User registration failed.'));
        return false;
      }
      await user.updateDisplayName(nameController.text.trim());
      await user.updatePhotoURL(profileImage);
      await user.reload();
      UserModel model = UserModel(
        id: user.uid,
        name: user.displayName ?? "Guest",
        email: user.email ?? "example@gm.com",
        phone: phoneController.text.trim(),
        profileImage: profileImage ?? 'assets/images/avatar1.png',
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(model.toJson());
      userModel = model;
      emit(RegisterSuccess(model));
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      phoneController.clear();
      formKey.currentState?.reset();
      return true;
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(_getRegisterErrorMessage(e)));
      return false;
    } catch (e) {
      emit(RegisterFailure('Unexpected error: ${e.toString()}'));
      return false;
    }
  }

  String _getRegisterErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/Password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return e.message ?? 'Registration error.';
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    return super.close();
  }
}
