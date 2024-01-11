import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/allCategories_model.dart';
import '../../models/notification_model.dart';
import '../../services/network_service.dart';

part 'authot_event.dart';
part 'authot_state.dart';

class AuthotBloc extends Bloc<AuthotEvent, AuthotState> {
  final NetworkService networkService;
  AuthotBloc(this.networkService) : super(AuthotInitial()) {
    on<AuthorLoadedEvent>((event, emit) async{
      emit(AuthotLoading());
      try{
       var response= await networkService.getAuthor("wsj.com","29397755bab44c4a861e2f85acd9d755");
       emit(AuthotSucsess(response));
      }catch(e){
        print(e);
        emit(AuthotFailur());
      }
    });
  }
}
