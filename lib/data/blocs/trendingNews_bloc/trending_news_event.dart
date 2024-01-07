part of 'trending_news_bloc.dart';

@immutable
abstract class TrendingNewsEvent {}
class TrendingNewsLoadedEvent extends TrendingNewsEvent{
   final String? country;

  TrendingNewsLoadedEvent(this.country);
}
