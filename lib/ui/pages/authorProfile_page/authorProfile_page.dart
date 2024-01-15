import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:kakar_news/ui/pages/authorProfile_page/resent.dart';

import 'news.dart';

class AuthorProfilePage extends StatelessWidget {
  const AuthorProfilePage({Key? key}) : super(key: key);
  static const routeName = '/authorProfilePage';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.more_vert),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  AppPng.kBBC,
                  height: 100,
                  width: 100,
                ),
                Column(
                  children: [
                    Text(
                      "1.2M",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Followers",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "124K",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Following",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "326",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "News",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "    BBC News",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              "    is an operational business division of the\n    British "
                  "   Broadcasting Corporation \n    for the gathering and "
                  "broadcasting of news\n    and current affairs.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 162,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      "Following",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 162,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      "Following",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),

              child: TabBar(
                physics: BouncingScrollPhysics(),
                isScrollable: true,
                tabs: [
                  Text('News',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  Text('Recent',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  News(),
                  Resent(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
