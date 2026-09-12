import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/cart/data/data_source/remote_data_source.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(1);

  final CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource();

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

  Future<void> postQuantity(String productId) async {
    await cartRemoteDataSource.postQuantity(
      productId: productId,
      quantity: state,
    );
  }
}
