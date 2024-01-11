import 'package:bloc/bloc.dart';
import 'package:kakar_news/data/models/allCategories_model.dart';
import 'package:kakar_news/data/services/network_service.dart';
import 'package:meta/meta.dart';

part 'all_categories_event.dart';

part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  final NetworkService networKservice;

  AllCategoriesBloc(this.networKservice) : super(AllCategoriesInitialState()) {
    on<AllCategoriesLoadedEvent>((event, emit) async {
      emit(AllCategoriesInitialState());
      try {
        var response = await networKservice.allNews(
            'wsj.com', 'd4bb802cd5434447a51f0477f58e5e22');
        emit(AllCategoriesLoadSuccessState(response));
      } catch (e) {
        print(e);
        emit(AllCategoriesFailureState());
      }
    });
  }
}
