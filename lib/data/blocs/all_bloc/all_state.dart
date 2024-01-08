part of 'all_bloc.dart';

@immutable
abstract class AllState {}

class AllInitial extends AllState {}
class AllLoading extends AllState {}
class AllSucsess extends AllState {
  final TrendingNewsModel trendingNewsModel;

  AllSucsess(this.trendingNewsModel);
}
class AllFailur extends AllState {}
