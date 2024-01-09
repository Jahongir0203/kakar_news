import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/blocs/trendingNews_bloc/trending_news_bloc.dart';
import 'package:kakar_news/data/services/network_service.dart';
import 'package:kakar_news/ui/pages/notification_page/notification_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../data/utils/app_colors.dart';
import '../../../data/utils/app_png.dart';

class TrendingPage extends StatelessWidget {
  TrendingPage({Key? key}) : super(key: key);
  static const routeName = '/trendingPage';
  TrendingNewsBloc trendingNewsBloc = TrendingNewsBloc(NetworkService(Dio()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => trendingNewsBloc,
      child: BlocBuilder<TrendingNewsBloc, TrendingNewsState>(
        bloc: trendingNewsBloc
          ..add(
            TrendingNewsLoadedEvent('us'),
          ),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Trending',
                style: buildTextStyle(
                  color: AppColors.kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.more_vert)),
              ],
            ),
            body: buildBody(context, state),
          );
        },
      ),
    );
  }

  buildBody(BuildContext context, TrendingNewsState state) {
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
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.trendingNewsModel.articles!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 183,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: AspectRatio(
                              aspectRatio: 1.6,
                              child: BlurHash(
                                imageFit: BoxFit.fill,
                                hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                                image: state.trendingNewsModel.articles?[index]
                                        .urlToImage ??
                                    'https://s.france24.com/media/display/d1676b6c-0770-11e9-8595-005056a964fe/w:1280/p:16x9/news_1920x1080.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      state.trendingNewsModel.articles![index].author ??
                          'BBC News',
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Text(
                        '${state.trendingNewsModel.articles![index].title}',
                        style: buildTextStyle(
                          color: AppColors.kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppPng.kBBC,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    state.trendingNewsModel.articles?[index]
                                            .source?.name ??
                                        'BBC News',
                                    style: buildTextStyle(
                                      color: AppColors.kGreyScale,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ' ${state.trendingNewsModel.articles![index].publishedAt?.substring(0, 10)}',
                                    style: buildTextStyle(
                                      color: AppColors.kGreyScale,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
