import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:kakar_news/ui/pages/home_page/tesla.dart';
import 'package:kakar_news/ui/pages/home_page/texno.dart';
import 'package:kakar_news/ui/pages/notification_page/notification_page.dart';
import 'package:kakar_news/ui/pages/trending_page/trending_page.dart';

import '../../../data/blocs/news_bloc/news_bloc.dart';
import '../../../data/network_servis/network_servis.dart';
import '../../../data/utils/app_png.dart';
import '../bookmark_page/bookmark_page.dart';
import '../explore_page/explore_page.dart';
import 'all_page.dart';
import 'apple_page.dart';
import 'country.dart';


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
    NewsBloc newsBloc=NewsBloc(NetWorkService(Dio()));

  
    return BlocProvider(
  create: (context) => newsBloc..add(AllLoadedEvent()),
  child: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {

        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppPng.kSplashPng, height: 35, width: 100,),
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
                  padding: const EdgeInsets.all( 8.0),
                  child: Container(
                    height: 48,
                    width: 379,
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 20),

                        suffix: Padding(
                          padding: const EdgeInsets.only(top: 18.0,),
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
                      Text("Trending", style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text("See all", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      if (state is NewsInitialState) {
                        return CircularProgressIndicator();
                      } else if (state is NewsLoadedState) {

                        return Column(
                          children: [
                            InkWell(
                               onTap:() {
                                 Navigator.pushNamed(context, TrendingPage.routeName);
                               },
                              child: Container(
                                height: 170,
                                width: 360,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage("${state.data.articles?.last.urlToImage}"),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 302.0),
                                    child: Text("Europe",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w400),),
                                  ),
                                  Text("${state.data.articles?[0].title}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                  Row(

                                    children: [
                                      Image.asset(
                                        AppPng.kBBC,
                                        height: 20,
                                      ),
                                      Text('${state.data.articles?[0].source?.name}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                                      SizedBox(width: 19,),Icon(
                                        Icons.watch_later_outlined,
                                        size: 12,
                                      ),
                                      Text('  ${state.data.articles?[0].publishedAt?.substring(0, 10)}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left:12,right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Latest",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                                  Text("See all",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: TabBar(
                                isScrollable: true,
                                //indicatorWeight: 10,
                                indicatorWeight: 1,
                                onTap: (index){

                                  print('index: $index');
                                },
                                tabAlignment:  TabAlignment.start,
                                tabs: [
                                  Tab(text: 'All '),
                                  Tab(text: 'Apple '),
                                  Tab(text: 'Tesla '),
                                  Tab(text: 'Country '),
                                  Tab(text: 'Technology '),
                                ],
                              ),

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
                        );
                      } else if (state is NewsFailureState) {
                        return Text('Failed to load data');
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } ) );
    }

  }



