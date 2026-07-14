import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/Auth/cubit/login_state.dart';
import 'package:project_iti/feature/services/user_services.dart';



class LoginCubit extends Cubit<LoginState> {
  final UserServices userServices;

  LoginCubit({required this.userServices}) : super(InitState());

  Future<void> loginCubit({
    required String username,
    required String password,
  }) async {
    emit(LoadingState());

    try {
      final user = await userServices.postLogin(
        username: username,
        password: password,
      );


      emit(SuccessState());
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }
}