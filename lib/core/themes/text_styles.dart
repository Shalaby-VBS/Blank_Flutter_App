// ignore_for_file: directives_ordering, sort_unnamed_constructors_first
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle _style(
    double fontSize,
    Color color,
    FontWeight fontWeight, {
    double? height,
  }) => TextStyle(
        fontSize: fontSize.sp,
        color: color,
        fontWeight: fontWeight,
        height: height,
      );

  // MARK: Size 11
  static final size11Neutral800W700 = _style(11,AppColors.neutral800, FontWeight.w700);

  // MARK: Size 12
  static final size12Secondary600W600 = _style(12, AppColors.secondary600, FontWeight.w600);
  static final size12Primary400W700 = _style(12, AppColors.primary400, FontWeight.w700);
  static final size12Primary700W400 = _style(12, AppColors.primary700, FontWeight.w400);
  static final size12Neutral600W400 = _style(12, AppColors.neutral600, FontWeight.w400);
  static final size12Neutral700W400 = _style(12, AppColors.neutral700, FontWeight.w400);
  static final size12Neutral700W700 = _style(12, AppColors.neutral700, FontWeight.w700);
  static final size12Neutral800W400 = _style(12, AppColors.neutral800, FontWeight.w400);
  static final size12Neutral800W700 = _style(12, AppColors.neutral800, FontWeight.w700);
  static final size12Neutral1000W400 = _style(12, AppColors.neutral1000, FontWeight.w400);
  static final size12Green200W400 = _style(12, AppColors.green200, FontWeight.w400);
  static final size12Green200W600 = _style(12,AppColors.green200, FontWeight.w600);
  static final size12Red100W400 = _style(12, AppColors.red100, FontWeight.w400);

  // MARK: Size 13
  static final size13Neutral100W400 = _style(13, AppColors.neutral100, FontWeight.w400);
  static final size13Neutral100W600 = _style(13, AppColors.neutral100, FontWeight.w600);
  static final size13Neutral700W400 = _style(13, AppColors.neutral700, FontWeight.w400);
  static final size13Neutral700W700 = _style(13, AppColors.neutral700, FontWeight.w700);
  static final size13Neutral900W400 = _style(13,AppColors.neutral900, FontWeight.w400,);
  static final size13Neutral1000W400 = _style(13, AppColors.neutral1000, FontWeight.w400);
  static final size13Neutral1000W600 = _style(13, AppColors.neutral1000, FontWeight.w600);
  static final size13Neutral1000W700 = _style(13, AppColors.neutral1000, FontWeight.w700);
  static final size13Yellow200W600 = _style(13, AppColors.yellow200, FontWeight.w600);

  // MARK: Size 14
  static final size14Primary600W600 = _style(14, AppColors.primary600, FontWeight.w600);
  static final size14Primary500W700 = _style(14,AppColors.primary500, FontWeight.w700);
  static final size14Neutral100W400 = _style(14, AppColors.neutral100, FontWeight.w400);
  static final size14Neutral100W600 = _style(14, AppColors.neutral100, FontWeight.w600);
  static final size14Neutral100W700 = _style(14, AppColors.neutral100, FontWeight.w700);
  static final size14Neutral700W600 = _style(14,AppColors.neutral700, FontWeight.w600);
  static final size14Neutral800W400 = _style(14, AppColors.neutral800, FontWeight.w400);
  static final size14Neutral800W600 = _style(14, AppColors.neutral800, FontWeight.w600);
  static final size14Neutral900W400 = _style(14, AppColors.neutral900, FontWeight.w400);
  static final size14Neutral900W700 = _style(14, AppColors.neutral900, FontWeight.w700);
  static final size14Neutral1000W400 = _style(14,AppColors.neutral1000, FontWeight.w400);
  static final size14Neutral1000W600 = _style(14, AppColors.neutral1000, FontWeight.w600);
  static final size14Neutral1000W700 = _style(14, AppColors.neutral1000, FontWeight.w700);
  static final size14Green200W700 = _style(14, AppColors.green200, FontWeight.w700);
  static final size14Red100W600 = _style(14, AppColors.red100, FontWeight.w600);

  // MARK: Size 15
  static final size15Neutral400W600 = _style(15, AppColors.neutral400, FontWeight.w600);
  static final size15Neutral900W400 = _style(15, AppColors.neutral900, FontWeight.w400);
  static final size15Neutral900W700 = _style(15, AppColors.neutral900, FontWeight.w700);
  static final size15Neutral1000W400 = _style(15, AppColors.neutral1000, FontWeight.w400);
  static final size15Neutral1000W600 = _style(15, AppColors.neutral1000, FontWeight.w600);

  // MARK: Size 16
  static final size16Neutral300W400 = _style(16, AppColors.neutral300, FontWeight.w400);
  static final size16Neutral900W400 = _style(16, AppColors.neutral900, FontWeight.w400);
  static final size16Neutral900W600 = _style(16, AppColors.neutral900, FontWeight.w600);
  static final size16Neutral900W700 = _style(16, AppColors.neutral900, FontWeight.w700);
  static final size16Neutral1000W400 = _style(16, AppColors.neutral1000, FontWeight.w400);
  static final size16Neutral1000W600 = _style(16, AppColors.neutral1000, FontWeight.w600);
  static final size16Neutral1000W700 = _style(16, AppColors.neutral1000, FontWeight.w700);
  static final size16Primary400W700 = _style(16, AppColors.primary400, FontWeight.w700);
  static final size16Primary500W600 = _style(16, AppColors.primary500, FontWeight.w600);
  static final size16Primary500W700 = _style(16, AppColors.primary500, FontWeight.w700);
  static final size16Primary500W800 = _style(16, AppColors.primary500, FontWeight.w800);
  static final size16Primary600W600 = _style(16, AppColors.primary600, FontWeight.w600);
  static final size16Primary700W700 = _style(16, AppColors.primary700, FontWeight.w700);
  static final size16Primary800W700 = _style(16, AppColors.primary800, FontWeight.w700);
  static final size16Primary100W800 = _style(16, AppColors.primary100, FontWeight.w800);
  static final size16Secondary500W600 = _style(16, AppColors.secondary500, FontWeight.w600);

  // MARK: Size 17
  static final size17Primary400W600 = _style(17, AppColors.primary400, FontWeight.w600);
  static final size17Primary500W600 = _style(17, AppColors.primary500, FontWeight.w600);
  static final size17Neutral100W700 = _style(17, AppColors.neutral100, FontWeight.w700);

  // MARK: Size 18
  static final size18Primary600W700 = _style(18, AppColors.primary600, FontWeight.w700);

  // MARK: Size 20
  static final size20Primary600W700 = _style(20, AppColors.primary600, FontWeight.w700);
  static final size20Neutral1000W700 = _style(20, AppColors.neutral1000, FontWeight.w700);

  // MARK: Size 24
  static final size24Neutral1000W700 = _style(24, AppColors.neutral1000, FontWeight.w700);
  static final size24Neutral100W600 = _style(24, AppColors.neutral100, FontWeight.w600);
}
