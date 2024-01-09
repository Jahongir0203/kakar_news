import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/blocs/trendingNews_bloc/trending_news_bloc.dart';
import 'package:kakar_news/data/services/network_service.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../../data/utils/app_colors.dart';
import '../../../../data/utils/app_png.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  static const String routeName = '/newsPage';
  TrendingNewsBloc trendingNewsBloc = TrendingNewsBloc(NetworkService(Dio()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => trendingNewsBloc,
      child: BlocBuilder<TrendingNewsBloc, TrendingNewsState>(
        bloc: trendingNewsBloc..add(TrendingNewsLoadedEvent('us')),
        builder: (context, state) {
          return Scaffold(
            body: buildNewsPageBody(context, state),
          );
        },
      ),
    );
  }

  buildNewsPageBody(BuildContext context, TrendingNewsState state) {
    if (state is TrendingNewsLoadInProgressState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is TrendingNewsFailureState) {
      return const Center(
        child: Text('Error'),
      );
    }

    if (state is TrendingNewsLoadSuccessState) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.trendingNewsModel.articles?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24, right: 4),
                        child: Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 96,
                              width: 96,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: AspectRatio(
                                  aspectRatio: 1.6,
                                  child: BlurHash(
                                    hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                                    imageFit: BoxFit.fill,
                                    image: state.trendingNewsModel
                                            .articles?[index].urlToImage ??
                                        'https://s.france24.com/media/display/d1676b6c-0770-11e9-8595-005056a964fe/w:1280/p:16x9/news_1920x1080.png',
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'USA',
                              style: buildTextStyle(
                                color: AppColors.kGreyScale,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${state.trendingNewsModel.articles![index].title}',
                              maxLines: 3,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: buildTextStyle(
                                color: AppColors.kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppPng.kBBC,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      state.trendingNewsModel.articles?[index].source?.name?? 'Uch savdoyi',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: buildTextStyle(
                                        color: AppColors.kGreyScale,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
