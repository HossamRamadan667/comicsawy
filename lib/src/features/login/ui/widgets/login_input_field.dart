import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const LoginInputField(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
      this.isObscure,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyles.font20LightGrayW700,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          label: Text(labelText),
        ));
  }
}
