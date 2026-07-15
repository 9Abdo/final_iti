import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(
        SignUpFailure(
          error: e.message ?? "Opps,Try agian",
        ),
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(
        LoginFailure(
          error: e.message ?? "Opps,Try agian",
        ),
      );
    }
  }
}