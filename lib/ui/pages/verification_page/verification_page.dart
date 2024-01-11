import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/ui/pages/verification_page/verifycation_password.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  static const routeName = '/verificationPage';
 TextEditingController textEditingController = TextEditingController();
 TextEditingController textEditingController1 = TextEditingController();
 TextEditingController textEditingController2 = TextEditingController();
 TextEditingController textEditingController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('OTP Verification', textAlign: TextAlign.center, style: TextStyle(color: AppColors.OnText, fontSize: 32, fontWeight: FontWeight.w700,),),
            Text('Enter the OTP sent to +67-1234-5678-9', style: TextStyle(color: AppColors.OnText, fontSize: 16, fontWeight: FontWeight.w400,),),
            SizedBox(height: 27),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),
                      prefixText: '${textEditingController.text}',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    ),
                  ),
                ),SizedBox(width: 17,),
                Container(
                  width: 64,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController1,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),
                      prefixText: '${textEditingController1.text}',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    ),
                  ),
                ), SizedBox(width: 17,),
                Container(
                  width: 64,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController2,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),
                      prefixText: '${textEditingController2.text}',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    ),
                  ),
                ),SizedBox(width: 17,),
                Container(
                  width: 64,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController3,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),
                      prefixText: '${textEditingController3.text}',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 27,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Resend code in ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.OnText),),
                Text('56s',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.red),),
              ],
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
                          Navigator.pushNamed(context,VerificationPassword.routeName);}
                      },
                      child: const Text(
                        'Verify',
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
    );
  }
}
