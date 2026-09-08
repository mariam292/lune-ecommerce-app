import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/home/presentation/cubits/cart_states.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(CartInitialStateState());

  HomeRemoteData homeRemoteData = HomeRemoteData();

  Future<void> addcartproducts({required product_id}) async {
    emit(AddToCartitemsLoadingState());

    await homeRemoteData
        .cartProducts(praductid: product_id)
        .then(
          onError: (error) {
            emit(AddToCartitemsFailureState(error: error.toString()));
          },

          (val) {
            emit(AddToCartitemsSuccessState());
          },
        );
  }
}
