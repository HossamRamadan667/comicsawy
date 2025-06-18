import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class ClearFormButton extends StatelessWidget {
  const ClearFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Clear',
          style: TextStyles.font17Gray,
        ));
  }
}
