part of 'detail_page_bloc.dart';

@immutable
abstract class DetailPageEvent {}
class DetailPageFollowButtonLoadedEvent extends DetailPageEvent{
  final int index;

  DetailPageFollowButtonLoadedEvent(this.index);

}
class DetailPageFavoriteButtonLoadedEvent extends DetailPageEvent{
  final int index;

  DetailPageFavoriteButtonLoadedEvent(this.index);


}
class DetailPageSaveButtonLoadedEvent extends DetailPageEvent{
  final int index;

  DetailPageSaveButtonLoadedEvent(this.index);

}
