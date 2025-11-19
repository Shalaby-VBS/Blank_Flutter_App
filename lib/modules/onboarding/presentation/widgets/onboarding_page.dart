import 'package:flutter/material.dart';

import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? backgroundColor;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      color: backgroundColor ?? AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 120.sp,
            color: AppColors.primary500,
          ),
          48.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          24.verticalSpace,
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.neutral600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
