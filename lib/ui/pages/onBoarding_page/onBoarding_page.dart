import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:kakar_news/ui/pages/signUp_page/signUp_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  static const routeName = '/onBoardingPage';

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppPng.onBoarding1),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply\ndummy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.OnText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 40, right: 24),
                              child: Container(
                                height: 50,
                                width: 85,
                                decoration: ShapeDecoration(
                                  color: AppColors.Onblue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    pageController.jumpToPage(1);
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppPng.onBoarding2),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply\ndummy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.OnText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: SizedBox(
                                height: 50,
                                width: 85,
                                child: MaterialButton(
                                  onPressed: () {
                                    pageController.jumpToPage(0);
                                  },
                                  child: const Center(
                                      child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.OnText),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 40, right: 24),
                            child: Container(
                              height: 50,
                              width: 85,
                              decoration: ShapeDecoration(
                                color: AppColors.Onblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  pageController.jumpToPage(2);
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppPng.onBoarding3),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply\ndummy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.OnText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: SizedBox(
                                height: 50,
                                width: 85,
                                child: MaterialButton(
                                  onPressed: () {
                                    pageController.jumpToPage(1);
                                  },
                                  child: const Center(
                                      child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.OnText),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 40, right: 24),
                            child: Container(
                              height: 50,
                              width: 142,
                              decoration: ShapeDecoration(
                                color: AppColors.Onblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, SignUpPage.routeName);
                                },
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 55, left: 24),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const JumpingDotEffect(
                    activeDotColor: AppColors.Onblue,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
