import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/trending_news_model.dart';
import '../../services/network_service.dart';


part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NetworkService netWorkService;
  NewsBloc(this.netWorkService) : super(NewsInitialState()) {
    //--------------------------------------------------------------------------
    // on<AppleEvent>((event, emit) async{
    //   try{
    //     ModelNews modelNews=await netWorkService.appleNews(event.from,event.to,event.sortBy,event.apiKey);
    //
    //     print(modelNews);
    //     if(modelNews!=null){
    //       emit(NewsLoadedState(modelNews));
    //     }
    //     else (NewsFailureState());
    //   }
    //   on Exception catch(_){
    //     print('e== ${_}');
    //     emit(NewsFailureState());
    //     rethrow;
    //   }
    // });
    // //--------------------------------------------------------------------------
    //
    // on<CountryEvent>((event, emit) async{
    //   try{
    //     ModelNews modelNews=await netWorkService.countryNews(event.country);
    //
    //     print(modelNews);
    //     if(modelNews!=null){
    //       emit(NewsLoadedState(modelNews));
    //     }
    //     else (NewsFailureState());
    //
    //   }
    //   on Exception catch(_){
    //     print('e-- ${_}');
    //     emit(NewsFailureState());
    //     rethrow;
    //   }
    // });
    // //--------------------------------------------------------------------------
    // on<TeslaEvent>((event, emit) async{
    //   try{
    //     ModelNews modelNews=await netWorkService.teslaNews(event.sources);
    //
    //     print(modelNews);
    //     if(modelNews!=null){
    //       emit(NewsLoadedState(modelNews));
    //     }
    //     else (NewsFailureState());
    //
    //   }
    //   on Exception catch(_){
    //     print('e-- ${_}');
    //     emit(NewsFailureState());
    //     rethrow;
    //   }
    // });
    // //---------------------------------------------------------------------
    // on<TechEvent>((event, emit) async{
    //   try{
    //     ModelNews modelNews=await netWorkService.techcrunchNews();
    //
    //     print(modelNews);
    //     if(modelNews!=null){
    //       emit(NewsLoadedState(modelNews));
    //     }
    //     else (NewsFailureState());
    //   }
    //   on Exception catch(_){
    //     print('e== ${_}');
    //     emit(NewsFailureState());
    //     rethrow;
    //   }
    // });

    //-------------------------------------------------------------------------------
    on<AllLoadedEvent>((event, emit) async{
      try{
        TrendingNewsModel modelNews=await netWorkService.allNews();

        print(modelNews);
        if(modelNews!=null){
          emit(NewsLoadedState(modelNews));
        }
        else (NewsFailureState());
      }
      on Exception catch(_){
        print('e== ${_}');
        emit(NewsFailureState());
        rethrow;
      }
    });
  }
}