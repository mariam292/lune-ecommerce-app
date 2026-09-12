abstract class LogInState {}

class LogInInitialState extends LogInState {}

class LogInLoadingState extends LogInState {}

class LogInSuccessState extends LogInState {}

class LogInFailureState extends LogInState {
  LogInFailureState({required this.error});
  final String error;
}
