import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategorNouryState {}

class CategoryNourInitialState extends CategorNouryState {}

class CategoryNourLoadingState extends CategorNouryState {}

class CategoryNourSuccessState extends CategorNouryState {
  CategoryNourSuccessState({required this.categoryNour});

  final List<dynamic> categoryNour;
}

class CategoryNourFailureState extends CategorNouryState {
  final String error;

  CategoryNourFailureState({required this.error});
}
