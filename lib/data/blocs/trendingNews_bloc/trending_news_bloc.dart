import 'package:bloc/bloc.dart';
import 'package:kakar_news/data/models/trending_news_model.dart';
import 'package:meta/meta.dart';

import '../../services/network_service.dart';

part 'trending_news_event.dart';

part 'trending_news_state.dart';

class TrendingNewsBloc extends Bloc<TrendingNewsEvent, TrendingNewsState> {
  final NetworkService networkService;

  TrendingNewsBloc(this.networkService) : super(TrendingNewsInitial()) {
    on<TrendingNewsLoadedEvent>((event, emit) async {
      emit(TrendingNewsLoadInProgressState());
      try {
        var response = await networkService.getTrendingNews(event.country!, '29397755bab44c4a861e2f85acd9d755');
        emit(TrendingNewsLoadSuccessState(response));
      } catch (e) {
        print(e);
        emit(TrendingNewsFailureState());
      }
    });
  }
}
