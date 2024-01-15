import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_page_event.dart';

part 'detail_page_state.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  DetailPageBloc() : super(DetailPageInitial()) {
    on<DetailPageFollowButtonLoadedEvent>((event, emit) {
      if (event.index == 1) {
        emit(DetailPageFollowState(event.index));
      }

      if (event.index == 2) {
        emit(DetailPageUnFollowState(event.index));
      }
    });

    on<DetailPageFavoriteButtonLoadedEvent>((event, emit) {
      if (event.index == 3) {
        emit(DetailPageFavoriteState(event.index));
      }
      if (event.index == 4) {
        emit(DetailPageUnFavoriteState(event.index));
      }
    });

    on<DetailPageSaveButtonLoadedEvent>((event, emit) {
      if (event.index == 5) {
        emit(DetailPageSavedState(event.index));
      }
      if (event.index == 6) {
        emit(DetailPageUnSavedState(event.index));
      }
    });
  }
}
