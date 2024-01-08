part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySucsess extends CategoryState {
  final TrendingNewsModel trendingNewsModel;

  CategorySucsess(this.trendingNewsModel);
}
class CategoryFailur extends CategoryState {}
