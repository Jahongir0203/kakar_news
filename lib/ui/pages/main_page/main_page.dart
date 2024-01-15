import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/mainPage_bloc/main_page_bloc.dart';
import 'package:kakar_news/ui/pages/bookmark_page/bookmark_page.dart';
import 'package:kakar_news/ui/pages/explore_page/explore_page.dart';
import 'package:kakar_news/ui/pages/home_page/home_page.dart';
import 'package:kakar_news/ui/pages/profile_page/profile_page.dart';

import '../../../data/utils/app_colors.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  static const String routeName = '/mainPage';
  MainPageBloc mainPageBloc = MainPageBloc();
  List pages = [
     const HomePage(),
    ExplorePage(),
     BookMarkPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainPageBloc,
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          return Scaffold(
            body: state is MainPageLoadSuccessState? pages[state.index]:pages[0],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.kPrimaryBlue,
              unselectedItemColor: AppColors.kGreyScale,
              currentIndex: state is MainPageLoadSuccessState? state.index:0 ,
              onTap: (e) {
                print(e);
               mainPageBloc.add(MainPageLoadedEvent(e));
              },
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.explore),
                    icon: Icon(Icons.explore_outlined),
                    label: 'Explore'),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.bookmark),
                  icon: Icon(Icons.bookmark_border),
                  label: 'BookMark',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),

          );
        },
      ),
    );
  }
}
