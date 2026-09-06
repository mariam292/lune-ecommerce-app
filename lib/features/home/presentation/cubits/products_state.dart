abstract class ProductsState {}
class ProductsInitialState extends ProductsState{}

class ProductsLoadingState extends ProductsState{}

class ProductsSuccessState extends ProductsState{

ProductsSuccessState( this.products);

final List products;



}

class ProductsFailureState extends ProductsState{

ProductsFailureState(this.error );

 final String error;

}