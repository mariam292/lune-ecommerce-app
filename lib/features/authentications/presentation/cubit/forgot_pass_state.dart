import 'package:nti_final_project/features/product/data/models/review_model.dart';

abstract class ForgotPassState {}

class ForgotPassInitialState extends ForgotPassState {}

class ForgotPassLoadingState extends ForgotPassState {}

class ForgotPassFailureState extends ForgotPassState {
  final String error;

  ForgotPassFailureState({required this.error});
}

class ForgotPassSuccessState extends ForgotPassState {}
