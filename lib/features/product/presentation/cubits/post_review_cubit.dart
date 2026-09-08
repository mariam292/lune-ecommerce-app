import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/post_review_remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/cubits/post_review_state.dart';

class PostReviewCubit extends Cubit<PostReviewState> {
  PostReviewCubit() : super(PostReviewInitialState());

  final PostReviewRemoteDataSource postReviewRemoteDataSource =
      PostReviewRemoteDataSource();

  Future<void> postReviewData(
    String name,
    String email,
    String pass,
    String phone,
  ) async {
    await postReviewRemoteDataSource
        .postReviewData(
          message: message,
          userId: userId,
          productId: productId,
          comment: comment,
        )
        .then(
          onError: (error) {
            emit(SignUpFaliure());
          },
          (value) {
            emit(SignUpSuccess());
          },
        );
  }
}
