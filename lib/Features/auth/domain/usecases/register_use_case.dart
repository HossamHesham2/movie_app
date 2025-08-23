import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<User?> call({required String email, required String password}) {
    return authRepository.register(email: email, password: password);
  }
}
