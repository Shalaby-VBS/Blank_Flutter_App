import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Responsive UI helper with design-to-screen size adaptation
/// Auto-initializes on first use with default design size 375x812
class ResponsiveHelper {
  // Lazy initialization with late final - initialized once on first access
  // Note: 'late' IS necessary here for lazy initialization
  // ignore: unnecessary_late
  static late final ResponsiveHelper instance = ResponsiveHelper._autoInit();

  static Size _designSize = const Size(375, 812);

  late Size _screenSize;

  double get screenWidth => _screenSize.width;
  double get screenHeight => _screenSize.height;
  double get scaleWidth => _screenSize.width / _designSize.width;
  double get scaleHeight => _screenSize.height / _designSize.height;
  double get scaleText => min(scaleWidth, scaleHeight);

  /// Auto-initialize with screen size from platform
  factory ResponsiveHelper._autoInit() {
    _isInstanceCreated = true; // Mark as created

    final helper = ResponsiveHelper._();

    // Get screen size from platform dispatcher
    final view = ui.PlatformDispatcher.instance.views.first;
    final physicalSize = view.physicalSize;
    final devicePixelRatio = view.devicePixelRatio;

    helper._screenSize = Size(
      physicalSize.width / devicePixelRatio,
      physicalSize.height / devicePixelRatio,
    );

    return helper;
  }

  static void setDesignSize(Size size) {
    assert(
      !_isInstanceCreated,
      'setDesignSize must be called BEFORE any ResponsiveHelper usage!\n'
      'Call it in main() before runApp().',
    );
    _designSize = size;
  }

  // Track if instance was created (for assertion)
  static bool _isInstanceCreated = false;

  ResponsiveHelper._();

  double w(num width) => width * scaleWidth;
  double h(num height) => height * scaleHeight;
  double sp(num fontSize) => fontSize * scaleText;
  double r(num radius) => radius * scaleText;

  bool get isTablet => screenWidth >= 600;
  bool get isMobile => screenWidth < 600;
  bool get isLandscape => screenWidth > screenHeight;
  bool get isPortrait => screenHeight > screenWidth;

  T orientation<T>({required T portrait, required T landscape}) =>
      isPortrait ? portrait : landscape;

  T device<T>({required T mobile, required T tablet}) =>
      isMobile ? mobile : tablet;

  EdgeInsets edgeInsets({
    num? all,
    num? horizontal,
    num? vertical,
    num? top,
    num? bottom,
    num? left,
    num? right,
  }) =>
      EdgeInsets.only(
        top: h(top ?? vertical ?? all ?? 0),
        bottom: h(bottom ?? vertical ?? all ?? 0),
        left: w(left ?? horizontal ?? all ?? 0),
        right: w(right ?? horizontal ?? all ?? 0),
      );

  EdgeInsets edgeInsetsSymmetric({num horizontal = 0, num vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: w(horizontal), vertical: h(vertical));

  BorderRadius borderRadius(num radius) => BorderRadius.circular(r(radius));
}

extension ResponsiveNum on num {
  double get w => ResponsiveHelper.instance.w(this);
  double get h => ResponsiveHelper.instance.h(this);
  double get sp => ResponsiveHelper.instance.sp(this);
  double get r => ResponsiveHelper.instance.r(this);

  SizedBox get horizontalSpace => SizedBox(width: w);
  SizedBox get verticalSpace => SizedBox(height: h);
  SizedBox get box => SizedBox(width: w, height: h);
}

extension ResponsiveContext on BuildContext {
  ResponsiveHelper get responsive => ResponsiveHelper.instance;
  double get screenWidth => ResponsiveHelper.instance.screenWidth;
  double get screenHeight => ResponsiveHelper.instance.screenHeight;
  bool get isTablet => ResponsiveHelper.instance.isTablet;
  bool get isMobile => ResponsiveHelper.instance.isMobile;
  bool get isLandscape => ResponsiveHelper.instance.isLandscape;
  bool get isPortrait => ResponsiveHelper.instance.isPortrait;
}
