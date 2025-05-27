import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const AppCard(
      {super.key, required this.child, this.radius, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(10))),
      margin: margin ??
          EdgeInsetsDirectional.only(bottom: 17.h, start: 7.w, end: 7.w),
      child: Padding(padding: padding ?? EdgeInsets.all(15.w), child: child),
    );
  }
}
