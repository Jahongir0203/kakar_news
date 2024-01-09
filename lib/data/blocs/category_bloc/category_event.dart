part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}
class CategoryLoadedEvent extends CategoryEvent{
  final String category;

  CategoryLoadedEvent(this.category);
}
