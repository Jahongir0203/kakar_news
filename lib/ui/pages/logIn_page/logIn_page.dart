import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/app_svg.dart';

import '../../widgets/app_textStyle.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);
  static const routeName = '/logInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: buildTextStyle(
                          color: AppColors.kHello_Clr,
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Again!',
                        style: buildTextStyle(
                          color: AppColors.kAgain_Clr,
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '''Welcome back you’ve
          been missed''',
                    textAlign:TextAlign.left,
                    style: buildTextStyle(
                      color: AppColors.kGreyScale,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: buildTextStyle(
                          color: AppColors.kGreyScale,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: buildTextStyle(
                          color: AppColors.kGreyScale,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.visibility,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: AppColors.kGreyScale),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: buildTextStyle(
                                color: AppColors.kGreyScale,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot the password ?',
                            style: buildTextStyle(
                              color: AppColors.kForgotPassword,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.kPrimaryBlue,
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: buildTextStyle(
                          color: AppColors.kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'or continue with',
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomButton(
                        image: AppSvg.kFacebookSvg,
                        name: 'Facebook',
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      CustomButton(
                        image: AppSvg.kGoogleSvg,
                        name: 'Google',
                        onTap: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don’t have an account ?",
                        style: buildTextStyle(
                          color: AppColors.kGreyScale,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: buildTextStyle(
                            color: AppColors.kPrimaryBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(flex:3, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });

  final String image;
  final String name;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.kWhiteGrey,
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          splashColor: AppColors.kPrimaryBlue,
          onPressed: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  image,
                ),
                Text(
                  name,
                  style: buildTextStyle(
                    color: AppColors.kGreyScale,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
