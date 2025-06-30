import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_state.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/clear_form_button.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/file_picker.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/upload_sound_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'title_and_category.dart';

class UploadSoundForm extends StatefulWidget {
  const UploadSoundForm({super.key});

  @override
  State<UploadSoundForm> createState() => _UploadSoundFormState();
}

class _UploadSoundFormState extends State<UploadSoundForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadSoundCubit, UploadSoundState>(
      listener: (context, state) {
        if (state is Fail) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.whenOrNull(
                    fail: (errorHandler) =>
                        errorHandler.soundErrorModel.message,
                  ) ??
                  'unknown error')));
        }
        setState(() {});
      },
      child: Form(
        key: BlocProvider.of<UploadSoundCubit>(context).formKey,
        child: Column(
          children: [
            const TitleAndCategory(),
            Spacing.verticalSpace(10),
            const FilePicker(),
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
    );
  }
}
