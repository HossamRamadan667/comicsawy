import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  static Widget horizontalSpace(double space) => SizedBox(
        width: space.w,
      );
  static Widget verticalSpace(double space) => SizedBox(
        height: space.h,
      );
}
