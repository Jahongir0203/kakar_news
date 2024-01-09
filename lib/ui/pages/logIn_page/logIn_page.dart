import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/cubits/logIn_cubit/log_in_cubit.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/app_svg.dart';
import 'package:kakar_news/ui/pages/country_page/country_page.dart';
import 'package:kakar_news/ui/pages/forgotPassword_page/forgotPassword_page.dart';
import 'package:kakar_news/ui/pages/signUp_page/signUp_page.dart';
import 'package:kakar_news/ui/pages/verification_page/verification_page.dart';

import '../../widgets/app_textStyle.dart';
import '../../widgets/google_facebook_button.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  static const routeName = '/logInPage';
  LogInCubit logInCubit = LogInCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => logInCubit,
      child: BlocBuilder<LogInCubit, LogInState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 32, right: 157),
                          child: Text(
                            '''Welcome back you’ve been missed''',
                            textAlign: TextAlign.left,
                            style: buildTextStyle(
                              color: AppColors.kGreyScale,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4,
                                ),
                                child: Text(
                                  'Email',
                                  style: buildTextStyle(
                                    color: AppColors.kGreyScale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4,
                                ),
                                child: Text(
                                  'Password',
                                  style: buildTextStyle(
                                    color: AppColors.kGreyScale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                child: TextField(
                                  obscureText: state.isVisible ?? false,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        print(state.isVisible);
                                        logInCubit.isPasswordShown(
                                            state.isVisible ?? false);
                                      },
                                      icon: Icon(
                                        (state.isVisible ?? false)
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: AppColors.kGreyScale),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: state.isSaved ?? false,
                                      onChanged: (value) {
                                        logInCubit.isPasswordSaved(value!);
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
                                  onPressed: () {
                                    Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                                  },
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.kPrimaryBlue,
                            ),
                            child: MaterialButton(
                              splashColor: AppColors.kGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context,VerificationPage.routeName);

                              },
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: buildTextStyle(
                                    color: AppColors.kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: Center(
                            child: Text(
                              'or continue with',
                              style: buildTextStyle(
                                color: AppColors.kGreyScale,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Row(
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
                                onPressed: () {
                                  Navigator.pushNamed(context, SignUpPage.routeName);
                                },
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
