import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/data_source/remote_data_source.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  final HomeRemoteData remoteData = HomeRemoteData();

  Future<void> get_category() async {
    emit(CategoryLoadingState());

    try {
      final categories = await remoteData.getCategories();

      log('CATEGORIES: $categories');

      emit(
        CategorySuccessState(
          category: categories,
        ),
      );
    } catch (e) {
      log('CATEGORY CUBIT ERROR: $e');

      emit(
        CategoryFailureState(
          error: e.toString(),
        ),
      );
    }
  }
}