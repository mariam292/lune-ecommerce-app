import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final List<Map<String, dynamic>> category;

  CategorySuccessState({
    required this.category,
  });
}

class CategoryFailureState extends CategoryState {
  final String error;

  CategoryFailureState({
    required this.error,
  });
}