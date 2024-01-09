import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/category_bloc/category_bloc.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:dio/dio.dart';

import '../../../data/services/network_service.dart';
import '../../../data/utils/app_colors.dart';
import '../../widgets/app_textStyle.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  static const routeName = '/explorePage';

  @override
  Widget build(BuildContext context) {
    CategoryBloc categoryBloc = CategoryBloc(NetworkService(Dio()));
    return BlocProvider(
      create: (context) => categoryBloc..add(CategoryLoadedEvent("techcrunch")),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Scaffold(
              body: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 24),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Topic",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                AppPng.khealth,
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Heatlh                        ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Get energizing workout\nmoves,healthlyrecipes...",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Container(
                              height: 34,
                              width: 78,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white),
                              child: Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                AppPng.ktexnolgy,
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Texnalogy                        ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "The application scientific\nknowledeg to the practi...",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              height: 34,
                              width: 78,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.blue),
                              child: Center(
                                  child: Text(
                                "Saved",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                AppPng.kart,
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Art                                    ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Art is a diverse range of\nhuman activity and result...",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 34,
                              width: 78,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.blue),
                              child: Center(
                                  child: Text(
                                "Saved",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Popular Topic                                                   ",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Expanded(
                      child: getBody(state),
                    ),
                  ])));
        },
      ),
    );
  }



  Widget getBody(CategoryState state) {
    if (state is CategoryLoading) {
      return CircularProgressIndicator();
    }
    if (state is CategorySucsess) {
      return ListView.builder(
        itemCount: state.trendingNewsModel.articles?.length ?? 0,
        itemBuilder: (context, index) {
          var article = state.trendingNewsModel.articles?[index];
          return Column(
            children: [
              Container(
                height: 183,
                width: 364,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage("${article?.urlToImage ?? ""}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article?.author ?? 'BBC News',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(article?.title ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  Row(
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
                              state.trendingNewsModel.articles?[index].source
                                      ?.name ??
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
                ],
              ),

              // Text(article?.description ?? ''),
              // Add more details or customize the ListTile as needed
            ],
          );
        },
      );
    }
    if (state is CategoryFailur) {
      return Text("Error");
    }
    return Container(); // Return an empty container if none of the above conditions are met
  }
}
