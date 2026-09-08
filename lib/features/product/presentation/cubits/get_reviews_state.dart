import 'package:nti_final_project/features/product/data/models/review_model.dart';

abstract class GetReviewsState {}

class GetReviewsInitialState extends GetReviewsState {}

class GetReviewsLoadingState extends GetReviewsState {}

class GetReviewsSuccessState extends GetReviewsState {
  final List<GetReviewModel> reviews;
  GetReviewsSuccessState({required this.reviews});
}

class GetReviewsFailureState extends GetReviewsState {
  GetReviewsFailureState(this.error);

  final String error;
}
