part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}
class MainPageLoadedEvent extends MainPageEvent{
  final int index;

  MainPageLoadedEvent(this.index);

}