import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/login_form.dart';
import 'widgets/login_title_with_paragraph.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginTitleWithParagraph(),
            Spacing.verticalSpace(20),
            const LoginForm(),
          ],
        ),
      )),
    );
  }
}
