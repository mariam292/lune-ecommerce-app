import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/delete_product_remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/cubits/delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit() : super(DeleteProducInitialState());

  final DeleteProductRemoteDataSource deleteProductRemoteDataSource =
      DeleteProductRemoteDataSource();

  Future<void> deleteProductData(String productId) async {
    try {
      await deleteProductRemoteDataSource.deleteProduct(productId);

      emit(DeleteProducSuccessState());
    } catch (e) {
      emit(DeleteProducFailureState());
    }
  }
}
