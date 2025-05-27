import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textStyle: TextStyles.font20Gray),
          child: const Text('Login')),
    );
  }
}
