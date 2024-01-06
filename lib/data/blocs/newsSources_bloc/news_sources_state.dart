part of 'news_sources_bloc.dart';

@immutable
abstract class NewsSourcesState {}
class NewsSourcesInitial extends NewsSourcesState{}
class NewsSourcesInitialState extends NewsSourcesState {
  final List<int>? indexs;

  NewsSourcesInitialState(this.indexs);

}

class NewsSourcesChangeState extends NewsSourcesState{
  final int? index;

  NewsSourcesChangeState(this.index);

}