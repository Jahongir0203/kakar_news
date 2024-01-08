import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/trending_news_model.dart';
import '../../services/network_service.dart';

part 'all_event.dart';
part 'all_state.dart';

class AllBloc extends Bloc<AllEvent, AllState> {
  final NetworkService networkService;
  AllBloc(this.networkService) : super(AllInitial()) {
    on<AllLoadedEvent>((event, emit)async {
      emit(AllLoading());
     try{
       var response= await networkService.allNews();

       emit(AllSucsess(response ));
     }
     catch(e){
       print(e);
       emit(AllFailur());

     }

    });
  }
}
