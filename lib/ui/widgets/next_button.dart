import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/utils/app_colors.dart';
import 'app_textStyle.dart';

Padding nextButton(BuildContext context, Function onTap,double verticalPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 24,
      vertical:verticalPadding , 
    ),
    child: InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.kPrimaryBlue,
        ),
        child: Center(
          child: Text(
            'Next',
            style: buildTextStyle(
              color: AppColors.kWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}
