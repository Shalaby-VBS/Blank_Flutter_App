import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:blank_flutter_project/core/themes/font_weights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle size12PrimaryRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeights.regular,
    color: AppColors.primary,
  );

  static TextStyle size14GreyDarkW300 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.greyDark,
  );
}
