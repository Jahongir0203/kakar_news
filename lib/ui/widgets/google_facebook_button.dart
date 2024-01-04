import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

import '../../data/utils/app_colors.dart';

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
