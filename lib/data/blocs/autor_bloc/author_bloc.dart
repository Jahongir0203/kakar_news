import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/categories_model.dart';
import '../../services/network_service.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final NetworkService networkService;
  AuthorBloc(this.networkService) : super(AuthorInitial()) {
    on<AuthorLoadedEvent>((event, emit)async {
      emit(AuthorLoading());
      try{
        var response=await networkService.getAuthor("29397755bab44c4a861e2f85acd9d755");
        emit(AuthorSucsess(response));


      }catch(e){
        print(e);
        emit(AuthorFalur());

      }

    });
  }
}
