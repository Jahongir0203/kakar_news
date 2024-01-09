import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/allCategories_bloc/all_categories_bloc.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:dio/dio.dart';
import '../../../data/services/network_service.dart';
import '../../../data/utils/app_colors.dart';
import '../../widgets/app_textStyle.dart';

class BookMarkPage extends StatelessWidget {
   BookMarkPage({Key? key}) : super(key: key);
  static const routeName = '/bookmarkPage';
AllCategoriesBloc allCategoriesBloc=AllCategoriesBloc(NetworkService(Dio()));
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return BlocProvider(
      create: (context) => allCategoriesBloc,
      child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
        bloc: allCategoriesBloc..add(AllCategoriesLoadedEvent()),
        builder: (context, state) {
          if (state is AllCategoriesLoadInProgressState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is AllCategoriesLoadSuccessState) {
            return Scaffold(

              body: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,top: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 187),
                      child: Text(
                        "Bookmark",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      height: 48,
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Search",
                          suffix: Image.asset(
                            AppPng.kBBC,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.allCategoriesModel.articles?.length ?? 0,
                        itemBuilder: (context, index) {
                          var article = state.allCategoriesModel.articles![index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 96,
                                    width: 96,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage("${article.urlToImage ?? ""}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.allCategoriesModel.articles![index].author ?? 'BBC News',
                                          style: buildTextStyle(
                                            color: AppColors.kGreyScale,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "${article.title ?? ""}",
                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppPng.kBBC,
                                              height: 20,
                                            ),
                                            Text(
                                              "${article.source?.name}",
                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                            ),
                                            SizedBox(width: 10),
                                            Icon(
                                              Icons.watch_later_outlined,
                                              size: 12,
                                            ),
                                            Text(
                                              "${article.publishedAt?.substring(5, 10)}",
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is AllCategoriesFailureState) {
            return Scaffold(
              body: Center(
                child: Text('Failed to load data'),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
