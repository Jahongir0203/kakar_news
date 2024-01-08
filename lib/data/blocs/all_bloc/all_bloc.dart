import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/all_model/all_model.dart';
import '../../network_servis/network_servis.dart';

part 'all_event.dart';
part 'all_state.dart';

class AllBloc extends Bloc<AllEvent, AllState> {
  final NetWorkService netWorkService;
  AllBloc(this.netWorkService) : super(AllInitial()) {

    on<AllLoadedEvent>((event, emit) {
      emit(AllLoading());
      try{
        var response= netWorkService.hammaNews();
        emit(AllSucsess(response as AllModel));


      }
      catch(e){
        print(e);
        emit(AllFailur());
      }

    });
  }


}
