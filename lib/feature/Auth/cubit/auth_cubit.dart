import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/core/helper/cach_helper.dart';
import 'package:project_iti/feature/Auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitStateAuth());

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(
            SignUpFailure(
              error: "This account already exists.",
            ),
          );
          break;

        case 'weak-password':
          emit(
            SignUpFailure(
              error: "Password is too weak.",
            ),
          );
          break;

        case 'invalid-email':
          emit(
            SignUpFailure(
              error: "Invalid email address.",
            ),
          );
          break;

        default:
          emit(
            SignUpFailure(
              error: e.message ?? "Something went wrong.",
            ),
          );
      }
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await credential.user!.getIdToken();

      await CachHelper.saveToken(token!);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(
            LoginFailure(
              error: "Account not found.",
            ),
          );
          break;

        case 'wrong-password':
          emit(
            LoginFailure(
              error: "Incorrect password.",
            ),
          );
          break;

        case 'invalid-email':
          emit(
            LoginFailure(
              error: "Invalid email address.",
            ),
          );
          break;

        case 'invalid-credential':
          emit(
            LoginFailure(
              error: "email or password is incorrect.",
            ),
          );
          break;

        case 'user-disabled':
          emit(
            LoginFailure(
              error: "This account has been disabled.",
            ),
          );
          break;

        default:
          emit(
            LoginFailure(
              error: e.message ?? "Login failed. Please try again.",
            ),
          );
      }
    }
  }

}