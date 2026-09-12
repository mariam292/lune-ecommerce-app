abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  CategorySuccessState(this.category);

  final List<dynamic> category;
}

class CategoryFailureState extends CategoryState {
  CategoryFailureState(this.error);

  final String error;
}
