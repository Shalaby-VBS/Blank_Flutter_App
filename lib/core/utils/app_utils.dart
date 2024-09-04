import 'package:blank_flutter_project/core/helpers/spaces.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUtils {
  AppUtils._();

  static closeKeyboard(BuildContext context) =>
    FocusScope.of(context).unfocus();

  static showBottomSheets(
      BuildContext context,
      Widget widget,
      bool? isDismissible,
      ) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible ?? true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        transitionAnimationController: AnimationController(
          vsync: Navigator.of(context),
          duration: const Duration(milliseconds: 500),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget,
                      Spaces.vertical(10),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );

  static showDialogs(
      BuildContext context,
      Widget widget,
      Widget actions,
      bool? isDismissible,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
          ),
          content: widget,
          actions: [actions],
        );
      },
    );
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formattedTime = DateFormat('HH:mm:ss').format(dateTime);
    return formattedTime;
  }

  static String getArabicMonthName(String monthNumber) {
    DateTime date = DateTime(0, int.tryParse(monthNumber)!);
    String monthName = DateFormat('MMMM', 'ar').format(date);

    return monthName;
  }
}
