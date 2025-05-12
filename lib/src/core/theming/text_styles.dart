import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24GrayW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'mikhak',
    color: AppColors.gray,
  );
  static TextStyle font20LightGrayW700 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'mikhak',
    color: AppColors.lightGray,
  );

  static TextStyle font17LightGrayW400 = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGray,
  );
}
