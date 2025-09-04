import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/auth/data/models/user_model.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/core/constants/constants_manager.dart';
import 'package:movie_app/core/database/cash/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  Future<bool> login() async {
    final prefs = await SharedPreferences.getInstance();

    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      emit(LoginValidationError());
      return false;
    }

    emit(LoginLoading());

    try {
      final user = await authRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        String? token = await user.getIdToken(true);
        prefs.setBool(ConstantsManager.isLoggedInKey, true);
        print("token : $token");
        emit(LoginSuccess(user.uid));
        emailController.clear();
        passwordController.clear();
        return true;
      } else {
        emit(LoginFailure('User not found.'));
        return false;
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(_getErrorMessage(e)));
      return false;
    } catch (e) {
      emit(LoginFailure('Unexpected error: ${e.toString()}'));
      return false;
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

  Future<bool> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final authClient = googleSignIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes([
        'email',
        'profile',
      ]);

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: authorization?.accessToken
      );

      final firebaseUser = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final user = firebaseUser.user;

      if (user != null) {
        final token = await user.getIdToken(true);
        await prefs.setString(ConstantsManager.tokenKey, token!);
        await prefs.setBool(ConstantsManager.isLoggedInKey, true);
        print("token -> $token");
        UserModel userModel = UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
          phone: user.phoneNumber,
          profileImage: user.photoURL,
          token: token,
        );

        CashHelper.saveData(
          boxName: 'user',
          key: 'googleUser',
          value: userModel.toJson(),
        );

        emit(LoginSuccess(user.uid));
        return true;
      } else {
        emit(LoginFailure('Google sign-in failed.'));
        return false;
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(_getErrorMessage(e)));
      return false;
    } catch (e) {
      emit(LoginFailure('Unexpected error: ${e.toString()}'));
      return false;
    }
  }

  Future<void> signOutGoogle() async {
    final googleSignIn = GoogleSignIn.instance;

    try {
      await googleSignIn.signOut();
      await googleSignIn.disconnect();
    } catch (e) {
      debugPrint("Google sign out error: $e");
    }
  }
}
