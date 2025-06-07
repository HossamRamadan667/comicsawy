import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class LoginTitleWithParagraph extends StatelessWidget {
  const LoginTitleWithParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to app Manager',
              style: TextStyles.font24GrayW700,
              textAlign: TextAlign.start,
            ),
            Spacing.verticalSpace(10),
            Text(
                'you can\'t manage app without an account, \n if you want an account contact with app admin to have an account',
                style: TextStyles.font17Gray),
          ]),
    );
  }
}
