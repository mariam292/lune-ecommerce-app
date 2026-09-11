abstract class ResetPassState {}

class ResetPassInitialState extends ResetPassState {}

class ResetPassLoadingState extends ResetPassState {}

class ResetPassFailureState extends ResetPassState {
  final String error;

  ResetPassFailureState({required this.error});
}

class ResetPassSuccesState extends ResetPassState {}
