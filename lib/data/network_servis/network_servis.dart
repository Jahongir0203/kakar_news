import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/all_model/all_model.dart';
import '../models/treding_Model/treding_model.dart';

part 'network_servis.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2')
@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NetWorkService{
  factory NetWorkService(Dio dio,{String baseUrl})=_NetWorkService;

  // @GET('/everything?q=apple&{from}&{to}&sortBy=popularity&apiKey=57d556b41e0a40169cbecea58e562d76')
  // Future<ModelNews> appleNews(
  //     @Query('from') String from,
  //     @Query('to') String to, String sortBy, String apiKey,
  //     );
  //
  // @GET('/everything?q=tesla&{from}&sortBy=publishedAt&apiKey=57d556b41e0a40169cbecea58e562d76')
  // Future<ModelNews> teslaNews(
  //     @Query('sources') String from,
  //     );
  //
  // @GET('/top-headlines?{country}&category=business&apiKey=57d556b41e0a40169cbecea58e562d76')
  // Future<ModelNews> countryNews(
  //     @Query('country') String country,);
  //
  // @GET('/top-headlines?sources=techcrunch&apiKey=57d556b41e0a40169cbecea58e562d76')
  // Future<ModelNews> techcrunchNews();



  // 57d556b41e0a40169cbecea58e562d76
  @GET('/everything?domains=wsj.com&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> allNews();

@GET("/everything")
Future<AllModel>hammaNews(
    @Query('country') String domains,
    @Query('apiKey') String apiKey,
    );

}