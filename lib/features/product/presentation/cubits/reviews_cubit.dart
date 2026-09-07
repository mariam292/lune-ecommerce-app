import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/reviews_remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/cubits/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitialState());

  ReviewsRemoteDataSource reviewsRemoteDataSource = ReviewsRemoteDataSource();

  Future<void> getReviews({required productId}) async {
    emit(ReviewsLoadingState());
    await reviewsRemoteDataSource
        .getReviews(productId)
        .then(
          onError: (err) {
            log(err.toString());
            emit(ReviewsFailureState(err.toString()));
          },
          (val) {
            log(val.toString());
            emit(ReviewsSuccessState(reviews: val));
          },
        );
  }
}
