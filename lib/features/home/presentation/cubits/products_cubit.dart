import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  HomeRemoteData homeRemoteData = HomeRemoteData();

  Future<void> get_products() async {
    emit(ProductsLoadingState());
    homeRemoteData.get_products().then( 

onError: (err) {
  log(err.toString());
  emit(ProductsFailureState(err));
}

,(val){
log(val.toString());
emit(ProductsSuccessState(val));


}





    );
  }
}
