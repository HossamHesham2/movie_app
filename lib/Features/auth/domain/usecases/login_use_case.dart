import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<User?> call({required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }
}
