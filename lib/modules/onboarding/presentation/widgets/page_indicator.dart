import 'package:flutter/material.dart';

import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: currentPage == index ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.primary500 : AppColors.neutral400,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}
