import 'package:blank_flutter_project/core/extensions/animations.dart';
import 'package:blank_flutter_project/core/extensions/navigations.dart';
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  final String routeName;

  const NotFoundScreen({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ❌ Error Icon
            Icon(
              Icons.error_outline,
              size: 100.w,
              color: Colors.redAccent.withValues(alpha: 0.8),
            ).fadeInScale(),

            20.verticalSpace,

            // 📝 Title
            Text(
              'Page Not Found',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ).fadeInSlide(delay: 200, slideOffset: 0.3),

            10.verticalSpace,

            // 🔗 Route name
            Text(
              routeName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ).fadeInSlide(delay: 300, duration: 400),

            30.verticalSpace,

            // 🔘 Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 14.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                context.pushAndRemoveAll(AppRoutes.login);
              },
              child: Text(
                'Go to Login',
                style: TextStyle(fontSize: 16.sp),
              ),
            ).fadeInSlide(delay: 400),
          ],
        ),
      ),
    );
  }
}
