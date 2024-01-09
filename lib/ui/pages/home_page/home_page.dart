import 'package:flutter/material.dart';
import 'package:kakar_news/ui/pages/search_page/search_page.dart';

import '../../../data/utils/app_png.dart';
import '../authorProfile_page/authorProfile_page.dart';
import '../bookmark_page/bookmark_page.dart';
import '../explore_page/explore_page.dart';
import '../notification_page/notification_page.dart';
import '../trending_page/trending_page.dart';
import 'all_page.dart';
import 'apple_page.dart';
import 'country.dart';
import 'tesla.dart';
import 'texno.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  int currentIndex = 0;

  List<Widget> pages = [
    Container(), // Home page
    ExplorePage(),
    BookMarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppPng.kSplashPng,
                height: 35,
                width: 100,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NotificationPage.routeName);
                },
                child: Image.asset(
                  AppPng.kRingBall,
                  height: 45,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            pages[currentIndex],
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                width: 379,
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(onPressed: (){
                      Navigator.pushNamed(context, AuthorProfilePage.routeName);
                    }, icon:const Icon(Icons.search),),
                    border: OutlineInputBorder(),
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 20),
                    suffix: Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                      ),
                      child: Image.asset(
                        AppPng.kIconss,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, TrendingPage.routeName);
                    },
                    child: Container(
                      height: 170,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(AppPng.kTreding),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 310.0),
                          child: Text(
                            "Europe",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          "Russian warship:Maskva sinks Black Sea       ", // You need to replace this with the actual title
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppPng.kBBC,
                              height: 20,
                            ),
                            Text(
                              'BBC News',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 19,
                            ),
                            Icon(
                              Icons.watch_later_outlined,
                              size: 12,
                            ),
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: TabBar(
                      isScrollable: true,
                      indicatorWeight: 1,
                      onTap: (index) {
                        print('index: $index');
                      },
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: 'All '),
                        Tab(text: 'Business '),
                        Tab(text: 'Sports'),
                        Tab(text: 'Entertainment '),
                        Tab(text: 'Technology '),
                      ],
                    ),
                  ),SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    child: TabBarView(
                      children: [
                        AllPage(),
                        ApplePage(),
                        Tesla(),
                        Country(),
                        Texnology(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
