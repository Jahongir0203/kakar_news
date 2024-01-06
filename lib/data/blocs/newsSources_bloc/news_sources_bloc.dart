import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_sources_event.dart';

part 'news_sources_state.dart';

class NewsSourcesBloc extends Bloc<NewsSourcesEvent, NewsSourcesState> {
  NewsSourcesBloc() : super(NewsSourcesInitial()) {
    on<NewsSourcesLoadedEvent>((event, emit) {
      List<int> indexs = [];
      indexs.add(event.index!);
      emit(NewsSourcesInitialState(indexs));
    });

    on<NewsSourcesUnFollowedEvent>((event,emit){
      int? index;
      emit(NewsSourcesChangeState(event.index));
    });
  }
}
