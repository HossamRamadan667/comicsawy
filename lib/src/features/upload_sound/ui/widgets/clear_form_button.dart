import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearFormButton extends StatelessWidget {
  const ClearFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: BlocProvider.of<UploadSoundCubit>(context).clear,
        child: Text('Clear', style: TextStyles.font17Gray));
  }
}
