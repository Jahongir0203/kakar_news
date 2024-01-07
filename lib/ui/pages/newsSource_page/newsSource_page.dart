import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/newsSources_bloc/news_sources_bloc.dart';
import 'package:kakar_news/data/utils/list.dart';
import 'package:kakar_news/ui/pages/fillProfile_page/fillProfile_page.dart';
import 'package:kakar_news/ui/pages/trending_page/trending_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../data/utils/app_colors.dart';
import '../../widgets/next_button.dart';

class NewsSourcePage extends StatelessWidget {
  NewsSourcePage({Key? key}) : super(key: key);
  static const routeName = '/newsSourcePage';
  NewsSourcesBloc newsSourcesBloc = NewsSourcesBloc();
  var list = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsSourcesBloc,
      child: BlocConsumer<NewsSourcesBloc, NewsSourcesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Choose your News Sources',
                style: buildTextStyle(
                  color: AppColors.kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      child: SizedBox(
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: AppColors.kGreyScale,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: AppColors.kGreyScale,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: AppColors.kGreyScale,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: AppColors.kGreyScale,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: newsSources.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.65,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: AppColors.kNewsContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: AppColors.kSourcesBG,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Image.asset(icNewsSources[index]),
                                  ),
                                ),
                                Text(
                                  newsSources[index],
                                  style: buildTextStyle(
                                    color: AppColors.kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (state is NewsSourcesInitialState) {
                                      newsSourcesBloc.add(
                                          NewsSourcesUnFollowedEvent(index));
                                    } else {
                                      newsSourcesBloc
                                          .add(NewsSourcesLoadedEvent(index));
                                    }
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: (list.contains(index))
                                          ? AppColors.kWhite
                                          : AppColors.kPrimaryBlue,
                                      border: Border.all(
                                        color: AppColors.kPrimaryBlue,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Following',
                                        style: buildTextStyle(
                                          color: (list.contains(index))
                                              ? AppColors.kPrimaryBlue
                                              : AppColors.kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: nextButton(
              context,
              () {
                Navigator.pushNamed(context, TrendingPage.routeName);
               // Navigator.pushNamed(context, FillProfilePage.routeName);
              },
              40,
            ),
          );
        },
        listener: (BuildContext context, NewsSourcesState state) {
          if (state is NewsSourcesInitialState) {
            list.addAll(state.indexs as Iterable);
          }

          if (state is NewsSourcesChangeState) {
            list.removeWhere((element) => element == state.index);
          }
        },
      ),
    );
  }
}
