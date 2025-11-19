import 'package:blank_flutter_project/core/config/flavor_config.dart';
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/bloc_observer_checker.dart';

class Utils {
  Utils._();

  /// Cached once for optimal performance - no repeated checks
  static final bool _enableLogs = FlavorConfig.isDev;

  static void printLog(String message) {
    if (!_enableLogs) return;
    debugPrint(message);
  }

  static unfocus(BuildContext context) => FocusScope.of(context).unfocus();

  static void setBlocObserver() => Bloc.observer = const BlocObserverChecker();

  showDefaultBottomSheet(
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
                      10.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );

  showDefaultDialog(
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
}
