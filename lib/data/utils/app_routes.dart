import 'package:flutter/cupertino.dart';
import 'package:kakar_news/ui/pages/authorProfile_page/authorProfile_page.dart';
import 'package:kakar_news/ui/pages/bookmark_page/bookmark_page.dart';
import 'package:kakar_news/ui/pages/comments_page/comments_page.dart';
import 'package:kakar_news/ui/pages/country_page/country_page.dart';
import 'package:kakar_news/ui/pages/explore_page/explore_page.dart';
import 'package:kakar_news/ui/pages/fillProfile_page/fillProfile_page.dart';
import 'package:kakar_news/ui/pages/forgotPassword_page/forgotPassword_page.dart';
import 'package:kakar_news/ui/pages/home_page/home_page.dart';
import 'package:kakar_news/ui/pages/logIn_page/logIn_page.dart';
import 'package:kakar_news/ui/pages/newsSource_page/newsSource_page.dart';
import 'package:kakar_news/ui/pages/notification_page/notification_page.dart';
import 'package:kakar_news/ui/pages/onBoarding_page/onBoarding_page.dart';
import 'package:kakar_news/ui/pages/search_page/search_page.dart';
import 'package:kakar_news/ui/pages/signUp_page/signUp_page.dart';
import 'package:kakar_news/ui/pages/topics_page/topics_page.dart';
import 'package:kakar_news/ui/pages/trending_page/trending_page.dart';
import 'package:kakar_news/ui/pages/verification_page/verification_page.dart';

import '../../ui/pages/detail_page/detail_page.dart';
import '../../ui/pages/search_page/author_page/author_page.dart';
import '../../ui/pages/search_page/news_page/news_page.dart';
import '../../ui/pages/search_page/topics_page/topics_page.dart';
import '../../ui/pages/splash_page/splash_page.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => SplashPage(),
        );
      case AuthorProfilePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => AuthorProfilePage(),
        );

      case BookMarkPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => BookMarkPage(),
        );
      case CommentsPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => CommentsPage(),
        );
      case CountryPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => CountryPage(),
        );
      case DetailPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => DetailPage(),
        );
      case ExplorePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => ExplorePage(),
        );
      case FillProfilePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => FillProfilePage(),
        );
      case ForgotPasswordPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => ForgotPasswordPage(),
        );
      case HomePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => HomePage(),
        );
      case LogInPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => LogInPage(),
        );
      case NewsSourcePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => NewsSourcePage(),
        );
      case NotificationPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => NotificationPage(),
        );
      case OnBoardingPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => OnBoardingPage(),
        );
      case SearchPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => SearchPage(),
        );
      case SignUpPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => SignUpPage(),
        );
      case TopicsPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => TopicsPage(),
        );
      case TrendingPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => TrendingPage(),
        );
      case VerificationPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => VerificationPage(),
        );
      case NewsPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => NewsPage(),
        );

      case AuthorPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => AuthorPage(),
        );
      case SearchTopicsPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => SearchTopicsPage(),
        );
    }
    return null;
  }
}
