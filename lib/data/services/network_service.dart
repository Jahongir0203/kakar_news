import 'package:dio/dio.dart';
import 'package:kakar_news/data/models/trending_news_model.dart';
import 'package:retrofit/retrofit.dart';

import '../models/notification_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('/everything?domains=wsj.com&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<TrendingNewsModel> allNews();

  @GET('/top-headlines')
  Future<TrendingNewsModel> getTrendingNews(
    @Query('country') String country,
    @Query('apiKey') String apiKey,
  );

  @GET('/top-headlines/sources')
  Future<NotificationModel> getNotifications(
    @Query('apiKey') String apiKey,
  );
}
