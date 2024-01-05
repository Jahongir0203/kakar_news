part of 'topics_bloc.dart';

@immutable
abstract class TopicsEvent {}
class TopicsButtonLoadedEvent extends TopicsEvent{
   final int? index;
  TopicsButtonLoadedEvent(this.index);
}
