import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source/quantity_data_source.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(0);

  final QuantityDataSource quantityDataSource = QuantityDataSource();

  Future<void> postQuantity(String productId) async {
    await quantityDataSource.postQuantity(
      productId: productId,
      quantity: state,
    );

    void increment() {
      emit(state + 1);
    }

    void decrement() {
      if (state > 1) {
        emit(state - 1);
      }
    }
  }
}
