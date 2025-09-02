import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/auth/data/models/user_model.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;
  final String boxName = "users";
  final String key = "userKey";

  RegisterCubit(this.authRepository) : super(RegisterInitial());
  UserModel? userModel;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? profileImage;

  static RegisterCubit get(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);

  void selectProfileImage({required String image}) {
    profileImage = image;
    emit(RegisterSelectProfileImage());
  }

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      emit(RegisterValidationError());
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      emit(RegisterFailure("Password not match"));
      return false;
    }

    emit(RegisterLoading());
    try {
      final user = await authRepository.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (user == null) {
        emit(RegisterFailure('User registration failed.'));
        return false;
      }
      String? token = await user.getIdToken(true);
      await user.updateDisplayName(nameController.text.trim());
      await user.updatePhotoURL(profileImage);
      await user.reload();
      final currentUser = FirebaseAuth.instance.currentUser;
      String? name = currentUser?.displayName;
      UserModel model = UserModel(
        id: user.uid,
        name: name,
        email: user.email ?? "example@gm.com",
        phone: phoneController.text.trim(),
        profileImage: profileImage ?? 'assets/images/avatar1.png',
        token: token ?? "token error",
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(model.toJson());
      // await FirebaseFirestore.instance.collection('favoriteMovies').doc(user.uid);
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
