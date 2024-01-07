part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}
class NewsLoadedState extends NewsState {
  final TrendingNewsModel data;
  NewsLoadedState(this.data);
}
class NewsFailureState extends NewsState{}