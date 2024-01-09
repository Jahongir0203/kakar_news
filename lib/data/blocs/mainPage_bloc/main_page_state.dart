part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {
  final int index=0;
}
class MainPageLoadSuccessState extends MainPageState{
  final int index;

  MainPageLoadSuccessState(this.index);

}