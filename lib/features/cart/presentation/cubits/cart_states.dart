abstract class CartState {}

class GetCartLodingState extends CartState {}

class GetCartFailureState extends CartState {}

class GetCartSuccessState extends CartState {
  final List productcart;
  GetCartSuccessState({required this.productcart});
}
