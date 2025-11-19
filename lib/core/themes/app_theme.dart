import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary600,
          secondary: AppColors.secondary500,
          error: AppColors.error,
          surface: Colors.white,
          surfaceTint: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primary600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary600,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.neutral300,
            disabledForegroundColor: AppColors.neutral600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary600, width: 2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: AppColors.primary600,
          unselectedLabelColor: AppColors.neutral600,
          indicatorColor: AppColors.primary600,
          dividerColor: Colors.transparent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary600,
          unselectedItemColor: AppColors.neutral600,
          elevation: 8,
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.neutral300,
          thickness: 1,
          space: 16.h,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary600,
          selectionColor: AppColors.primary100,
          selectionHandleColor: AppColors.primary600,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
        ),
      );
}
