import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakar_news/data/utils/app_svg.dart';
import 'package:kakar_news/ui/pages/search_page/search_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../data/utils/app_colors.dart';
import '../../../data/utils/app_png.dart';
import '../bookmark_page/bookmark_page.dart';
import '../explore_page/explore_page.dart';
import '../notification_page/notification_page.dart';
import '../trending_page/trending_page.dart';
import 'all_page.dart';
import 'categories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: AppBar(
              backgroundColor: AppColors.kWhite,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: Image.asset(
                AppPng.kSplashPng,
                height: 35,
                width: 100,
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NotificationPage.routeName);
                  },
                  child: SvgPicture.asset(AppSvg.kNotification),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                // pages[currentIndex],
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: textEditingController,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SearchPage.routeName);
                              },
                              icon: const Icon(Icons.search),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: AppColors.kGreyScale,
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: AppColors.kGreyScale,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: AppColors.kGreyScale,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: AppColors.kGreyScale,
                                )),
                            hintText: "Search",
                            hintStyle: buildTextStyle(
                              color: AppColors.kGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            suffix: const Icon(
                              Icons.settings_input_component,
                              color: AppColors.kGrey,
                            ),
                            suffixStyle:
                                buildTextStyle(color: AppColors.kGrey)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: buildTextStyle(
                        color: AppColors.kBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, TrendingPage.routeName);
                      },
                      child: Text(
                        "See all",
                        style: buildTextStyle(
                          color: AppColors.kGreyScale,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 170,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:  DecorationImage(
                      image: AssetImage(AppPng.kTrending),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Europe",
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child: Text(
                        "Russian warship:Maskva sinks Black Sea",
                        // You need to replace this with the actual title
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: buildTextStyle(
                          color: AppColors.kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppPng.kBBC,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'BBC News',
                          // You need to replace this with the actual source name
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
                          '1 h ago',
                          // You need to replace this with the actual date
                          style: buildTextStyle(
                            color: AppColors.kGreyScale,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest",
                      style: buildTextStyle(
                        color: AppColors.kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See all",
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    isScrollable: true,
                    tabs: [
                      Text('All'),
                      Text('Business'),
                      Text('Entertainment'),
                      Text('General'),
                      Text('Health'),
                      Text('Science'),
                      Text('Sports'),
                      Text('Technology'),
                    ],
                  ),
                ),
                SizedBox(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    children: [
                      AllCategoriesPage(),
                      CategoriesPage(category: 'Business'),
                      CategoriesPage(category: 'Entertainment'),
                      CategoriesPage(category: 'General'),
                      CategoriesPage(category: 'Health'),
                      CategoriesPage(category: 'Science'),
                      CategoriesPage(category: 'Sports'),
                      CategoriesPage(category: 'Technology'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
