import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_nour_states.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  HomeRemoteData homeRemoteData = HomeRemoteData();
  Future<void> getCategory() async {
    emit(CategoryLoadingState());

    await homeRemoteData.getCategories().then(
      onError: (error) {
        emit(CategoryFailureState(error));
      },
      (val) {
        emit(CategorySuccessState(val));
      },
    );
  }
}

class CategoryNourCubit extends Cubit<CategorNouryState> {
  CategoryNourCubit() : super(CategoryNourInitialState());

  final HomeRemoteData remoteData = HomeRemoteData();

  Future<void> get_categoryNour() async {
    emit(CategoryNourInitialState());

    try {
      final categories = await remoteData.getCategories();

      log('CATEGORIES: $categories');

      emit(CategoryNourSuccessState(categoryNour: categories));
    } catch (e) {
      log('CATEGORY CUBIT ERROR: $e');

      emit(CategoryNourFailureState(error: e.toString()));
    }
  }
}
