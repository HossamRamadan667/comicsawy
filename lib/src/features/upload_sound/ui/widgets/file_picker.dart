import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/spacing.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilePicker extends StatelessWidget {
  const FilePicker({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadSoundCubit, UploadSoundState>(
        builder: (context, state) {
      return Row(
        children: [
          OutlinedButton(
              onPressed: BlocProvider.of<UploadSoundCubit>(context).picFile,
              child: Text('Pic file', style: TextStyles.font17Gray)),
          Spacing.horizontalSpace(5),
          Expanded(
            child: Text(
                style: TextStyles.font17Gray.copyWith(
                    color: state is InvalidInput &&
                            BlocProvider.of<UploadSoundCubit>(context)
                                    .pickedFileName ==
                                null
                        ? Colors.red
                        : null),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                BlocProvider.of<UploadSoundCubit>(context).pickedFileName ??
                    'no File picked yet'),
          )
        ],
      );
    });
  }
}
