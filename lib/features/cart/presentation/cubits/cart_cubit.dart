import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/cart/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(GetCartLodingState());
  final CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource();

  Future<void> getcart()async {
    await cartRemoteDataSource.getcart().then(
      onError: (error) {
        emit(GetCartFailureState());
      },
      (val) {
        emit(GetCartSuccessState(productcart:val));
      },
    );
  }
}
