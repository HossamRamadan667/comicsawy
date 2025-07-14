import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/upload_sound_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleAndCategory extends StatefulWidget {
  const TitleAndCategory({super.key});

  @override
  State<TitleAndCategory> createState() => _TitleAndCategoryState();
}

class _TitleAndCategoryState extends State<TitleAndCategory> {
  List<String> categories = [];
  bool isNewCategory = false;

  @override
  void initState() {
    BlocProvider.of<UploadSoundCubit>(context)
        .getCategories()
        .then((categoriesResponse) => setState(() {
              categories = categoriesResponse;
            }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: UploadSoundInput(
            labelText: 'Title',
            prefixIcon: const Icon(Icons.title),
            controller:
                BlocProvider.of<UploadSoundCubit>(context).titleController,
            validator:
                BlocProvider.of<UploadSoundCubit>(context).fieldsValidator,
          ),
        ),
        Spacing.horizontalSpace(10),
        Expanded(
          child: Column(
            children: [
              isNewCategory
                  // category INPUT
                  ? UploadSoundInput(
                      labelText: 'Category',
                      prefixIcon: const Icon(Icons.category),
                      controller: BlocProvider.of<UploadSoundCubit>(context)
                          .categoryController,
                      validator: BlocProvider.of<UploadSoundCubit>(context)
                          .fieldsValidator,
                    )
                  // category DROP_DOWN
                  : DropdownButtonFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.category),
                        labelStyle: TextStyles.font17LightGrayW400,
                      ),
                      style: TextStyles.font20LightGrayW700,
                      hint: const Text('Category'),
                      value: BlocProvider.of<UploadSoundCubit>(context)
                          .selectedCategory,
                      items: categories
                          .map((category) => DropdownMenuItem(
                              value: category, child: Text(category)))
                          .toList(),
                      onChanged: (value) =>
                          BlocProvider.of<UploadSoundCubit>(context)
                              .selectedCategory = value,
                    ),
              Spacing.verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isNewCategory,
                    onChanged: (value) => setState(() {
                      isNewCategory = !isNewCategory;
                      //   Clear selectedCategory to prevent using it when we add a new category
                      BlocProvider.of<UploadSoundCubit>(context)
                          .selectedCategory = null;
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
