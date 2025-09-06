import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else {
        throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }

  @override
  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.sendEmailVerification();
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("The account already exists for that email.");
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(
        e.message ?? 'An error occurred while resetting password',
      );
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
        serverClientId:
            dotenv.env["SERVER_CLINT_ID"],
      );
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      rethrow;
    }
  }
}
