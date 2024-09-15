import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
              strokeWidth: 2.sp,
            )
          : Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
              ),
            ),
    );
  }
}
