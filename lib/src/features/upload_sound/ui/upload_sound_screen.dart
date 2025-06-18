import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/clear_form_button.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/file_picker.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/title_and_category.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/upload_sound_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadSoundScreen extends StatelessWidget {
  const UploadSoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        child: Form(
          child: Column(
            children: [
              const TitleAndCategory(),
              Spacing.verticalSpace(10),
              FilePicker(),
              Spacing.verticalSpace(10),
              Row(
                children: [
                  const Expanded(
                    child: UploadButton(),
                  ),
                  Spacing.horizontalSpace(10),
                  const Expanded(
                    child: ClearFormButton(),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
