import 'dart:io';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/core/networking/api_services.dart';
import 'package:comicsawy/src/core/networking/error_handler.dart';
import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/features/upload_sound/data/models/upload_sound_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadSoundRepo {
  final ApiServices apiServices;
  UploadSoundRepo({required this.apiServices});

  Future<ApiResult<UploadSoundResponseModel>> uploadSound(
      {required String name,
      required String category,
      required File soundFile}) async {
    try {
      // upload to storage
      Reference fileRef = FirebaseStorage.instance
          .ref('categories/$category/')
          .child('$name.mp3')
        ..updateMetadata(SettableMetadata(contentType: 'audio/mpeg'));
      TaskSnapshot putFileResponse = await fileRef.putFile(soundFile);

      // get sound Url
      String uri = await putFileResponse.ref.getDownloadURL();

      // get current user token
      String? auth = await FirebaseAuth.instance.currentUser!.getIdToken();

      // upload sound to db
      UploadSoundResponseModel response = await apiServices.uploadSound(
          SoundModel(category: category, name: name, uri: uri), auth!);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.fail(ErrorHandler.handle(error));
    }
  }
}
