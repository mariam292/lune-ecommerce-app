import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  HomeRemoteData homeRemoteData = HomeRemoteData();
  Future<void> get_category() async {
    emit(CategoryLoadingState());

    try {
      final val=  await homeRemoteData.get_categories();
         emit(CategorySuccessState(val));
    } on Exception catch (e) {
      emit(CategoryFailureState(e.toString()));
    }
       
      

      
        
      
    
  } 
}
