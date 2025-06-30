import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/core/networking/error_handler.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/upload_sound/data/models/pic_file_error.dart';
import 'package:comicsawy/src/features/upload_sound/data/models/upload_sound_response_model.dart';
import 'package:comicsawy/src/features/upload_sound/data/repos/upload_sound_repo.dart';
import 'package:comicsawy/src/features/upload_sound/logic/cubit/upload_sound_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

class UploadSoundCubit extends Cubit<UploadSoundState> {
  final SoundsRepo soundsRepo;
  final UploadSoundRepo uploadSoundRepo;

  UploadSoundCubit({required this.soundsRepo, required this.uploadSoundRepo})
      : super(UploadSoundState.idle());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  List<String>? categories;
  String? selectedCategory;

  File? _pickedFile;
  String? pickedFileName;

  Future<List<String>> getCategories() async {
    return await soundsRepo.getCategories();
  }

  void picFile() async {
    try {
      var pickedFile = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['mp3']);

      if (pickedFile != null) {
        _pickedFile = File(pickedFile.files.single.path!);
        pickedFileName = pickedFile.files.single.name;
        // just to rebuild screen
        emit(Idle());
      } else {
        emit(UploadSoundState.fail(
            ErrorHandler.handle(PicFileError(message: 'pic file canceled'))));
      }
    } catch (e) {
      emit(UploadSoundState.fail(
          ErrorHandler.handle(PicFileError(message: 'unable to pic File'))));
    }
  }

  uploadSound() async {
    if (_pickedFile == null) {
      return emit(InvalidInput());
    }

    if (!formKey.currentState!.validate()) {
      return emit(InvalidInput());
    }

    await _startUpload();
  }

  _startUpload() async {
    emit(UploadSoundState.loading());

    ApiResult<UploadSoundResponseModel> uploadSoundResponse =
        await uploadSoundRepo.uploadSound(
      name: titleController.text,
      category: categoryController.text,
      soundFile: _pickedFile!,
    );

    uploadSoundResponse.when(
      success: (soundResponse) {
        emit(UploadSoundState.success(soundResponse));
      },
      fail: (errorHandler) {
        emit(UploadSoundState.fail(errorHandler));
      },
    );
  }

  clear() {
    _pickedFile = null;
    pickedFileName = null;
    titleController.clear();
    categoryController.clear();
  }

  String? Function(String?)? fieldsValidator = (String? value) {
    if (value == null || value.trim().length < 2) {
      return 'This field must be at least 2 letters ';
    }
    return null;
  };
}
