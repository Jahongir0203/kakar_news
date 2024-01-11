import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:kakar_news/ui/pages/country_page/country_page.dart';
import 'package:kakar_news/ui/pages/verification_page/verification_page.dart';

import '../../../data/utils/app_colors.dart';

class VerificationPassword extends StatelessWidget {
  VerificationPassword({super.key});
  static const routeName = '/verificationPassword';
 TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reset\nPassword', style: TextStyle(color: Color(0xFF4E4B66), fontSize: 32, fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,),),
                SizedBox(height: 13,),
                Text.rich(
                  TextSpan(children: [TextSpan(text: 'New Password',
                        style: TextStyle(
                          color: Color(0xFF4E4B66),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Color(0xFFC20052),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined)
                  ),
                ),
                Text.rich(
                  TextSpan(children: [TextSpan(text: 'Confirm new password',
                    style: TextStyle(
                      color: Color(0xFF4E4B66),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Color(0xFFC20052),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  ),
                ),
                TextField(
                  controller: textEditingController1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined)
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: AppColors.Onblue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if(textEditingController.text != ''){
                              pageController.jumpToPage(1);}
                          },
                          child: const Text(
                            'Submit',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                        height: 66,
                        width: 217,
                        child: Image.asset(AppPng.kSplashPng,fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 70,),
              Text('Congratulations!', style: TextStyle(color: Color(0xFF4E4B66), fontSize: 32, fontWeight: FontWeight.w700,),
              ),
              Text(
                'Your account is ready to use',
                style: TextStyle(
                  color: Color(0xFF4E4B66),
                  fontSize: 16,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40,left: 24,right: 24),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: AppColors.Onblue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if(textEditingController.text != ''){
                            Navigator.pushNamed(context,CountryPage.routeName);}
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
