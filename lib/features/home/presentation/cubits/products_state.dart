import 'package:nti_final_project/features/home/data/product_model.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;
  ProductsSuccessState({required this.products});
}

class ProductsFailureState extends ProductsState {
  ProductsFailureState(this.error);

  final String error;
}
