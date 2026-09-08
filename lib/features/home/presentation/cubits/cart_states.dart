 abstract class AddToCartState    {} 

class CartInitialStateState  extends  AddToCartState {}

 

class AddToCartitemsLoadingState extends  AddToCartState  {}
   


class   AddToCartitemsSuccessState extends   AddToCartState {}



class   AddToCartitemsFailureState extends AddToCartState{
       AddToCartitemsFailureState({ required this.error});

      final String error;

}