import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  HomeRemoteData homeRemoteData = HomeRemoteData();
<<<<<<< HEAD
  Future<void> getCategory() async {
    emit(CategoryLoadingState());

    await homeRemoteData.getCategories().then(
      onError: (error) {
        emit(CategoryFailureState(error));
      },
      (val) {
=======

  Future<void> get_category() async {
    emit(CategoryLoadingState());

    await homeRemoteData.get_categories().then(
      onError: (error) {
        emit(CategoryFailureState(error.toString()));
      },
      (val) {
        print(val);
>>>>>>> origin/Nour
        emit(CategorySuccessState(val));
      },
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/Nour
