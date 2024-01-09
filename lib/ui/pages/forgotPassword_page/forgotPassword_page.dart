import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:kakar_news/ui/pages/verification_page/verification_page.dart';


class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
static const routeName='/forgotPasswordPage';

  TextEditingController textEditingController = TextEditingController();
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    textEditingController.text = '';
    return Scaffold(
      appBar: AppBar(
      ),
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
                Text(
                  'Forgot\nPassword ?', style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: AppColors.OnText),
                ),
                Text('Don’t worry! it happens. Please select the\nemail or number associated with your\naccount.',
                  style: TextStyle(color: AppColors.OnText, fontSize: 16, fontWeight: FontWeight.w400,),
                ),
                SizedBox(height: 16,),
                Container(
                  width: 383,
                  height: 100,
                  decoration: BoxDecoration(color: AppColors.forgotPassword, borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          height: 64, width: 64,
                          decoration: BoxDecoration(color: AppColors.Onblue, borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Container(height: 24,width:24,child: Image.asset(AppPng.EmailIcon)),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('via Email:', style: TextStyle(color: AppColors.OnText, fontSize: 14, fontWeight: FontWeight.w400,),
                            ),
                            SizedBox(height: 5,),
                            Text('example@youremail.com',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  width: 383,
                  height: 100,
                  decoration: BoxDecoration(color: AppColors.forgotPassword, borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          height: 64, width: 64,
                          decoration: BoxDecoration(color: AppColors.Onblue, borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Container(height: 24,width:24,child: Image.asset(AppPng.SmsIcon)),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('via SMS:', style: TextStyle(color: AppColors.OnText, fontSize: 14, fontWeight: FontWeight.w400,),
                            ),
                            SizedBox(height: 5,),
                            Text('+62-8421-4512-2531',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),
                            )
                          ],
                        ),

                      ],
                    ),
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
                            pageController.jumpToPage(1);
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot\nPassword ?', style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: AppColors.OnText),
                ),
                Text('Don’t worry! it happens. Please enter the\naddress associated with your account.',
                  style: TextStyle(color: AppColors.OnText, fontSize: 16, fontWeight: FontWeight.w400,),
                ),
                SizedBox(height: 16,),
                Text('Email ID / Mobile number',style: TextStyle(color: AppColors.OnText,fontSize: 14,),),
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13))
                    ),
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
                            Navigator.pushNamed(context,VerificationPage.routeName);}
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
        ],
      ),
    );
  }
}
