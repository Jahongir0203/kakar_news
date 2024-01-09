part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}
class CategoriesLoadedEvent extends CategoriesEvent{
  final String category;

  CategoriesLoadedEvent(this.category);

}