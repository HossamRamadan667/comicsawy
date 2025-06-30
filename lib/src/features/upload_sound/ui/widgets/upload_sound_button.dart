import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadSoundCubit, UploadSoundState>(
        builder: (context, state) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 50.h),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
          onPressed: BlocProvider.of<UploadSoundCubit>(context).uploadSound,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upload', style: TextStyles.font20Gray),
              state is Loading
                  ? const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                  : state is Success
                      ? const Icon(Icons.download_done_rounded)
                      : state is Fail
                          ? const Icon(Icons.cancel_outlined)
                          : const Icon(Icons.upload),
            ],
          ));
    });
  }
}
