import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/category_bloc/category_bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/services/network_service.dart';
import '../../../data/utils/app_png.dart';

class ApplePage extends StatelessWidget {
  const ApplePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryBloc categoryBloc = CategoryBloc(NetworkService(Dio()));
    return BlocProvider(
      create: (context) => categoryBloc..add(CategoryLoadedEvent("business")),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return CircularProgressIndicator();
          } else if (state is CategorySucsess) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: ListView.builder(
                    itemCount: state.trendingNewsModel.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      var article = state.trendingNewsModel.articles![index];

                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 96,
                                width: 96,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  "${article.urlToImage ?? ""}",
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Error occurred while loading the image
                                    return Center(
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.red,size: 100,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              Expanded(child: Column(
                                children: [
                                  Text("${article.title ?? ""}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppPng.kBBC,
                                        height: 20,
                                      ),
                                      Text("${article.source?.name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
                                      SizedBox(width: 10,),
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: 12,
                                      ),
                                      Text("${article.publishedAt?.substring(0, 10)}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),

                          // Add additional widgets as needed for each article
                          SizedBox(height: 16), // Add spacing between articles
                        ],
                      );
                    },
                  ),

                ),
              ),
            );
          } else if (state is CategoryFailur) {
            return Text('Failed to load data');
          }
          return Container();
        },
      ),
    );
  }
}
