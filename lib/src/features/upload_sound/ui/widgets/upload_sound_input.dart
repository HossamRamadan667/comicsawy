import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class UploadSoundInput extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const UploadSoundInput({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.font20LightGrayW700,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(labelText),
      ),
      validator: validator,
    );
  }
}
