import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/ui/pages/onBoarding_page/onBoarding_page.dart';

import '../../../data/blocs/splash_bloc/splash_bloc.dart';
import '../../../data/utils/app_png.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
   static const String routeName = "/splashPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashLoadedEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
        if(state is SplashLoaded){
     Navigator.pushReplacementNamed(context,OnBoardingPage.routeName);
        }
        },
        child: Scaffold(
          body: Center(
            child:Image.asset(AppPng.kSplashPng),
          ),

        ),
      ),
    );
  }
}
