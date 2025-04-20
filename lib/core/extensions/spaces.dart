import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spaces on num {
  SizedBox get verticalSpace => SizedBox(height: h);
  SizedBox get horizontalSpace => SizedBox(width: w);
}
