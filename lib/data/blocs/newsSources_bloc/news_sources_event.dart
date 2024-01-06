part of 'news_sources_bloc.dart';

@immutable
abstract class NewsSourcesEvent {}
class NewsSourcesLoadedEvent extends NewsSourcesEvent{
  final int? index;

  NewsSourcesLoadedEvent(this.index);

}

class NewsSourcesUnFollowedEvent extends NewsSourcesEvent{
  final int? index;

  NewsSourcesUnFollowedEvent(this.index);

}