import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/post_review_remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/cubits/post_review_state.dart';

class PostReviewCubit extends Cubit<PostReviewState> {
  PostReviewCubit() : super(PostReviewInitialState());

  final PostReviewRemoteDataSource postReviewRemoteDataSource =
      PostReviewRemoteDataSource();

  Future<void> postReviewData(String productId, String comment) async {
    try {
      await postReviewRemoteDataSource.postReviewData(
        productId: productId,
        comment: comment,
      );

      emit(PostReviewSuccessState());
    } catch (e) {
      emit(PostReviewFailureState());
    }
  }
}
