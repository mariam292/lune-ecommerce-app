import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/get_reviews_remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/cubits/get_reviews_state.dart';

class ReviewsCubit extends Cubit<GetReviewsState> {
  ReviewsCubit() : super(GetReviewsInitialState());

  GetReviewsRemoteDataSource reviewsRemoteDataSource =
      GetReviewsRemoteDataSource();

  Future<void> getReviews({required productId}) async {
    emit(GetReviewsLoadingState());
    await reviewsRemoteDataSource
        .getReviews(productId)
        .then(
          onError: (err) {
            log(err.toString());
            emit(GetReviewsFailureState(err.toString()));
          },
          (val) {
            log(val.toString());
            emit(GetReviewsSuccessState(reviews: val));
          },
        );
  }
}
