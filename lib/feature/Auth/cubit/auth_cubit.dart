import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/Auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitStateAuth());

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

      await credential.user!.sendEmailVerification();
      log("Email sent successfully");

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(error: e.message ?? "Error"));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.reload();

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        emit(LoginFailure(error: "User not found"));
        return;
      }

      if (!user.emailVerified) {

        emit(LoginFailure(error: "Please verify your email first."));

        return;
      }

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(error: e.message ?? e.code));
    }
  }

  Future<void> resendVerificationEmail() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } catch (_) {}
  }
}
