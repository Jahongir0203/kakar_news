import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/allCategories_bloc/all_categories_bloc.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:dio/dio.dart';

import '../../../data/services/network_service.dart';
import '../../../data/utils/app_colors.dart';
import '../../widgets/app_textStyle.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  static const routeName = '/explorePage';
AllCategoriesBloc allCategoriesBloc=AllCategoriesBloc(NetworkService(Dio()));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => allCategoriesBloc,
      child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
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
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Heatlh ",
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
                              ),
                              SizedBox(
                                width: 16,
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
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Texnalogy",
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
                              ), SizedBox(
                                width: 8,
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
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Art",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Art is a diverse range\nhuman activit and result...",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 4,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                          height: 900,
                          child: getBody(state)),
                    ])),
              ));
        },
      ),
    );
  }



   getBody(AllCategoriesState state) {
    if (state is AllCategoriesLoadInProgressState) {
      return CircularProgressIndicator();
    }
    if (state is AllCategoriesLoadSuccessState) {

      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.allCategoriesModel.articles?.length ?? 0,
        itemBuilder: (context, index) {
          var article = state.allCategoriesModel.articles?[index];
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
                              state.allCategoriesModel.articles?[index].source
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
                              ' ${state.allCategoriesModel.articles![index].publishedAt?.substring(0, 10)}',
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
            ],
          );
        },
      );
    }
    if (state is AllCategoriesFailureState) {
      return Text("Error");
    }
  }
}
