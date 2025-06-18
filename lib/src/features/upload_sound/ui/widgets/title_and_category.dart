import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/upload_sound_input.dart';
import 'package:flutter/material.dart';

class TitleAndCategory extends StatefulWidget {
  const TitleAndCategory({super.key});

  @override
  State<TitleAndCategory> createState() => _TitleAndCategoryState();
}

class _TitleAndCategoryState extends State<TitleAndCategory> {
  List<String> dummyCategories = [
    'a',
    'b',
    'c',
  ];
  String? selectedItem;
  bool isNewCategory = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: UploadSoundInput(
            controller: TextEditingController(),
            labelText: 'Title',
            prefixIcon: const Icon(Icons.title),
          ),
        ),
        Spacing.horizontalSpace(10),
        Expanded(
          child: Column(
            children: [
              isNewCategory
                  ? UploadSoundInput(
                      labelText: 'Category',
                      prefixIcon: Icon(Icons.category),
                      controller: TextEditingController())
                  : DropdownButtonFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.category),
                        labelStyle: TextStyles.font17LightGrayW400,
                      ),
                      style: TextStyles.font20LightGrayW700,
                      hint: const Text('Category'),
                      value: selectedItem,
                      items: dummyCategories
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => selectedItem = value,
                    ),
              Spacing.verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isNewCategory,
                    onChanged: (value) => setState(() {
                      isNewCategory = !isNewCategory;
                    }),
                  ),
                  Text('New Category', style: TextStyles.font17Gray),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
