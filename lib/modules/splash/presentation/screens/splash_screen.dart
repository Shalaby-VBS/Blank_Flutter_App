import 'dart:async';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:blank_flutter_project/core/extensions/animations.dart';
import 'package:blank_flutter_project/core/extensions/navigations.dart';
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/routing/app_routes.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Always go to onboarding for first-time experience
    context.pushReplacement(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car_rounded,
              size: 100.sp,
              color: Colors.white,
            ).fadeInScale(delay: 300),
            24.verticalSpace,
            Text(
              'app_name'.tr(),
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).fadeInSlide(delay: 500),
            8.verticalSpace,
            Text(
              'tagline'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
              ),
            ).fadeInSlide(delay: 700),
          ],
        ),
      ),
    );
  }
}
