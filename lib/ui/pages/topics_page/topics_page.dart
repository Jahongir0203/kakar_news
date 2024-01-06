import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/topics_bloc/topics_bloc.dart';
import 'package:kakar_news/data/utils/list.dart';
import 'package:kakar_news/ui/pages/newsSource_page/newsSource_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../data/utils/app_colors.dart';

class TopicsPage extends StatelessWidget {
  TopicsPage({Key? key}) : super(key: key);
  static const routeName = '/topicsPage';
  TopicsBloc topicsBloc = TopicsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => topicsBloc,
      child: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Choose your Topics',
                style: buildTextStyle(
                  color: AppColors.kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Padding(
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
                    itemCount: topics.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          topicsBloc.add(TopicsButtonLoadedEvent(index));
                          state as TopicsButtonLoadSuccessState;
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: state is TopicsButtonLoadSuccessState &&
                                    index == state.index
                                ? AppColors.kPrimaryBlue
                                : AppColors.kWhite,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.kPrimaryBlue,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                topics[index],
                                maxLines: 1,
                                style: buildTextStyle(
                                  color: state is TopicsButtonLoadSuccessState &&
                                      index == state.index
                                      ? AppColors.kWhite
                                      : AppColors.kPrimaryBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NewsSourcePage.routeName);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.kPrimaryBlue,
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: buildTextStyle(
                        color: AppColors.kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
