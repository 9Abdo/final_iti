abstract class LoginState {}

class InitState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {}

class FailureState extends LoginState {
  final String error;
  FailureState({required this.error});
}
