part of 'detail_page_bloc.dart';

@immutable
abstract class DetailPageState {}

class DetailPageInitial extends DetailPageState {
}

class DetailPageFollowState extends DetailPageState {
  final int index;

  DetailPageFollowState(this.index);
}

class DetailPageUnFollowState extends DetailPageState {
  final int index;

  DetailPageUnFollowState(this.index);
}

class DetailPageFavoriteState extends DetailPageState {
  final int index;

  DetailPageFavoriteState(this.index);
}

class DetailPageUnFavoriteState extends DetailPageState {
  final int index;

  DetailPageUnFavoriteState(this.index);
}

class DetailPageSavedState extends DetailPageState {
  final int index;

  DetailPageSavedState(this.index);
}

class DetailPageUnSavedState extends DetailPageState {
  final int index;

  DetailPageUnSavedState(this.index);
}
