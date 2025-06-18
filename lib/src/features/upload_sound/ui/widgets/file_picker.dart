import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class FilePicker extends StatelessWidget {
  FilePicker({super.key});
  String? pickedFileName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
            onPressed: () {},
            child: Text(
              'Pic file',
              style: TextStyles.font17Gray,
            )),
        Spacing.horizontalSpace(5),
        Expanded(
          child: Text(
              style: TextStyles.font17Gray,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              pickedFileName ?? 'no File picked yet'),
        )
      ],
    );
  }
}
