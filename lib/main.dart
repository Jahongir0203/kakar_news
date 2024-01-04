import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_routes.dart';
import 'package:kakar_news/ui/pages/logIn_page/logIn_page.dart';
import 'package:kakar_news/ui/pages/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: SplashPage.routeName,
      initialRoute: LogInPage.routeName,
      onGenerateRoute: AppRouteUtils.onGenerateRoute,
    );
  }
}
