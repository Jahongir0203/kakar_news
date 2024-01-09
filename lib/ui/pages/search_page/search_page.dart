import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakar_news/ui/pages/search_page/topics_page/topics_page.dart';

import '../../../data/utils/app_colors.dart';
import '../../../data/utils/app_svg.dart';
import 'author_page/author_page.dart';
import 'news_page/news_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
 static const routeName='/searchPage';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: SizedBox(
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppSvg.kNo),
                  ),
                  hintText: 'search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.kGreyScale),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.kGreyScale),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.kGreyScale),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.kGreyScale),
                  ),
                ),
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Text('News'),
              Text('Topics'),
              Text('Author'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            NewsPage(),
            SearchTopicsPage(),
            AuthorPage(),
          ],
        ),
      ),
    );
  }
}
