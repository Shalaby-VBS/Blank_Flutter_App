import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final Color? color;

  const LoaderWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: 2.sp,
      ),
    );
  }
}
