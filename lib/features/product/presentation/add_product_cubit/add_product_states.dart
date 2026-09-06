class AddProductState {}

class AddProductInitialState extends AddProductState {}

class AddProductLodingState extends AddProductState {}

class AddProductFaliureState extends AddProductState {
  final String errormessage;

  AddProductFaliureState({required this.errormessage});
}

class AddProductSuccessState extends AddProductState {
 final List myproduct;

  AddProductSuccessState({required this.myproduct});
}
