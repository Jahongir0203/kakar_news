import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/list.dart';
import 'package:kakar_news/ui/pages/authorProfile_page/authorProfile_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../../../data/utils/app_colors.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);
  static const String routeName = '/authorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        itemCount: icNewsSources.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 24,
              left: 24,
            ),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, AuthorProfilePage.routeName);
              },
              child: SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            icNewsSources[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              newsSources[index],
                              style: buildTextStyle(
                                color: AppColors.kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${followers[index]} Followers',
                              style: buildTextStyle(
                                color: AppColors.kGreyScale,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      width: 95,
                      decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.kPrimaryBlue),
                      ),
                      child: Center(
                        child: Text(
                          '+ Follow',
                          style: buildTextStyle(
                            color: AppColors.kPrimaryBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
