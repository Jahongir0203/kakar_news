part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}
class CategoriesLoadInProgressState extends CategoriesState {}
class CategoriesLoadSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;

  CategoriesLoadSuccessState(this.categoriesModel);

}
class CategoriesFailureState extends CategoriesState {}
