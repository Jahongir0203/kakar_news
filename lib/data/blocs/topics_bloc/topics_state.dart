part of 'topics_bloc.dart';

@immutable
abstract class TopicsState {}

class TopicsInitial extends TopicsState {}

class TopicsButtonLoadSuccessState extends TopicsState {
  final int? index;

  TopicsButtonLoadSuccessState(this.index);
}
