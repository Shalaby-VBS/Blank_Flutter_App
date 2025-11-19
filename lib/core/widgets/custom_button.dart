import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:blank_flutter_project/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final dynamic title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDimmed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double height;
  final double? width;
  final double elevation;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.isLoading = false,
    this.isDimmed = false,
    this.backgroundColor,
    this.borderColor,
    this.textColor = Colors.white,
    this.height = 48,
    this.width,
    this.elevation = 2,
    this.borderRadius,
    this.textStyle,
  }) : assert(
          title is String || title is Widget,
          'Title must be either String or Widget',
        );

  /// Wrap widget with DefaultTextStyle to override text color for dimmed state
  Widget _wrapWidgetWithColorOverride(Widget widget, Color color) {
    return DefaultTextStyle(
      style: TextStyle(color: color),
      child: IconTheme(
        data: IconThemeData(color: color),
        child: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = isLoading || isDimmed || onPressed == null;

    // Don't apply opacity when dimmed (text color is already gray)
    // Only apply opacity for loading or null onPressed states
    final double labelOpacity =
        (isLoading || (onPressed == null && !isDimmed)) ? 0.7 : 1.0;

    final Color baseBg = backgroundColor ?? AppColors.primary600;
    final Color effectiveBg = disabled ? baseBg.withOpacity(0.5) : baseBg;
    final Color effectiveBorder =
        disabled ? Colors.transparent : (borderColor ?? Colors.transparent);

    // Use dark gray color for text when dimmed, otherwise use textColor
    final Color effectiveTextColor = isDimmed
        ? Colors.black // Dark gray for dimmed state
        : textColor;

    // Title
    final Widget titleWidget = title is String
        ? Text(
            title as String,
            style: (textStyle ?? TextStyles.size14Neutral100W700).copyWith(
              color: effectiveTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : _wrapWidgetWithColorOverride(title as Widget, effectiveTextColor);

    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: effectiveBg,
      foregroundColor:
          effectiveTextColor, // Use effective text color (gray when dimmed)
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
        side: BorderSide(color: effectiveBorder, width: 1.w),
      ),
      minimumSize: Size(width?.w ?? double.infinity, height.h),
      elevation: disabled ? 0 : elevation,
      shadowColor: Colors.transparent,
    );

    final Widget labelChild = isLoading
        ? SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
                strokeWidth: 2.sp,
                valueColor: AlwaysStoppedAnimation<Color>(
                  backgroundColor ?? AppColors.primary600,
                )),
          )
        : titleWidget;

    if (icon != null) {
      return ElevatedButton.icon(
        key: key,
        style: style,
        onPressed: disabled ? null : onPressed,
        icon: Opacity(opacity: labelOpacity, child: icon!),
        label: Opacity(opacity: labelOpacity, child: labelChild),
      );
    } else {
      return ElevatedButton(
        key: key,
        style: style,
        onPressed: disabled ? null : onPressed,
        child: Opacity(opacity: labelOpacity, child: labelChild),
      );
    }
  }
}
