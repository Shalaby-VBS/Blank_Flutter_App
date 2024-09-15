import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap, this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.focused)
                ? AppColors.primary
                : Colors.grey.shade700,
          ),
        ),
        fillColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? Colors.grey.shade100
              : Colors.white,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.sp,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.5.sp,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? AppColors.primary
              : Colors.grey.shade700,
        ),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onSuffixIconTap,
                borderRadius: BorderRadius.circular(50.r),
                child: Icon(
                  suffixIcon,
                  color: Colors.grey.shade700,
                ),
              )
            : null,
      ),
    );
  }
}
