import 'package:nti_final_project/features/product/data/models/review_model.dart';

abstract class ReviewsState {}

class ReviewsInitialState extends ReviewsState {}

class ReviewsLoadingState extends ReviewsState {}

class ReviewsSuccessState extends ReviewsState {
  final List<ReviewModel> reviews;
  ReviewsSuccessState({required this.reviews});
}

class ReviewsFailureState extends ReviewsState {
  ReviewsFailureState(this.error);

  final String error;
}
