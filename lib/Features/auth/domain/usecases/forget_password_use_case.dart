import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  Future<void> call({required String email}) {
    return authRepository.forgetPassword(email: email);
  }
}
