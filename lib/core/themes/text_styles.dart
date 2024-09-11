import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:blank_flutter_project/core/themes/font_weights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();

  static final TextStyle size12PrimaryRegular = TextStyle(
    fontSize: 12.sp,
    color: AppColors.primary,
    fontWeight: FontWeights.regular,
  );

  static final TextStyle size14GreyDarkLight = TextStyle(
    fontSize: 14.sp,
    color: AppColors.greyDark,
    fontWeight: FontWeights.light,
  );

  static final TextStyle size16BlackRegular = TextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeights.regular,
  );
}
