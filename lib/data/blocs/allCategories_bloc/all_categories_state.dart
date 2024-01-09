part of 'all_categories_bloc.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitialState extends AllCategoriesState {}
class AllCategoriesLoadInProgressState extends AllCategoriesState {}
class AllCategoriesLoadSuccessState extends AllCategoriesState {
  final AllCategoriesModel allCategoriesModel;

  AllCategoriesLoadSuccessState(this.allCategoriesModel);

}
class AllCategoriesFailureState extends AllCategoriesState {}
