import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/remote_data_source/remote_data_source.dart';
import 'package:nti_final_project/features/product/presentation/add_product_cubit/add_product_states.dart';

class AddProductCuibt extends Cubit<AddProductState> {
  AddProductCuibt() : super(AddProductInitialState());

  final AddProductRemoteDataSource addProductRemoteDataSource =
      AddProductRemoteDataSource();
  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String categoryid,
    required int stock,
    required String imageurl,
  }) async {
    emit(AddProductLodingState());
    await addProductRemoteDataSource
        .addProduct(
          name: name,
          description: description,
          price: price,
          categoryid: categoryid,
          stock: stock,
          imageurl: imageurl,
        )
        .then(
          onError: (error) {
            emit(AddProductFaliureState(errormessage: '$error'));
          },
          (val) {
            emit(AddProductSuccessState(myproduct: val));
          },
        );
  }
}
