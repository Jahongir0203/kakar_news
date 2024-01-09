import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_routes.dart';
import 'package:kakar_news/ui/pages/forgotPassword_page/forgotPassword_page.dart';
import 'package:kakar_news/ui/pages/logIn_page/logIn_page.dart';
import 'package:kakar_news/ui/pages/onBoarding_page/onBoarding_page.dart';
import 'package:kakar_news/ui/pages/splash_page/splash_page.dart';
import 'package:kakar_news/ui/pages/verification_page/verification_page.dart';

void main() {
  Faker faker=Faker();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ForgotPasswordPage.routeName,
      onGenerateRoute: AppRouteUtils.onGenerateRoute,
    );
  }
}
