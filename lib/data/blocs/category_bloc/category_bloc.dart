import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/trending_news_model.dart';
import '../../services/network_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NetworkService networkService;
  CategoryBloc(this.networkService) : super(CategoryInitial()) {
    on<CategoryLoadedEvent>((event, emit)async {
      emit(CategoryLoading());
      try{
        var response=await networkService.exploreNews(event.sources, "29397755bab44c4a861e2f85acd9d755");
        emit(CategorySucsess(response));
        
      }catch(e){
        print(e);
        emit(CategoryFailur());
      }
      
    });
  }
}
