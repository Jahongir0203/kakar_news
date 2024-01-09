import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kakar_news/data/models/categories_model.dart';
import 'package:meta/meta.dart';

import '../../services/network_service.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final NetworkService networkService;

  CategoriesBloc(this.networkService) : super(CategoriesInitialState()) {
    on<CategoriesLoadedEvent>((event, emit) async {
      emit(CategoriesLoadInProgressState());
      try {
        var response = await networkService.getCategoriesNews(
          event.category, '29397755bab44c4a861e2f85acd9d755',);
        emit(CategoriesLoadSuccessState(response));
      } catch (e) {
        print(e);
        emit(CategoriesFailureState());
      }
    });
  }
}
