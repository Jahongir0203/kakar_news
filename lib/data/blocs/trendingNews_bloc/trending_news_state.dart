part of 'trending_news_bloc.dart';

@immutable
abstract class TrendingNewsState {}

class TrendingNewsInitial extends TrendingNewsState {}
class TrendingNewsLoadInProgressState extends TrendingNewsState {}
class TrendingNewsLoadSuccessState extends TrendingNewsState {
  final TrendingNewsModel trendingNewsModel;

  TrendingNewsLoadSuccessState(this.trendingNewsModel);
}
class TrendingNewsFailureState extends TrendingNewsState {}
