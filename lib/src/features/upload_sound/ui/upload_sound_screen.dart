import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_cubit.dart';
import 'package:comicsawy/src/features/upload_sound/ui/widgets/upload_sound_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocProvider.value(
          value: getIt<UploadSoundCubit>(),
          child: const UploadSoundForm(),
        ),
      )),
    );
  }
}
