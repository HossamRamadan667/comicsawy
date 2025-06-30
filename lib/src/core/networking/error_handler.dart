import 'package:comicsawy/src/features/home/data/models/sound_error_model.dart';
import 'package:comicsawy/src/features/upload_sound/data/models/pic_file_error.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum PossibleErrors {
  timeOut,
  response,
  cancel,
  unknown,
}

extension ExpectedErrorsExtension on PossibleErrors {
  SoundErrorModel getErrorModel() {
    switch (this) {
      case PossibleErrors.timeOut:
        return SoundErrorModel(code: 408, message: 'النت بطئ يا صاحبي');
      case PossibleErrors.cancel:
        return SoundErrorModel(code: -2, message: 'الطلب اتلغي يا صاحبي');
      case PossibleErrors.response:
        return SoundErrorModel(code: 408, message: 'مممم جرب اطفي وافتح كدا');
      case PossibleErrors.unknown:
        return SoundErrorModel(code: 408, message: 'مشعارف اطفيه و افتحو كدا');
    }
  }
}

class ErrorHandler implements Exception {
  late SoundErrorModel soundErrorModel;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      soundErrorModel = _handleDioError(error);
    } else if (error is FirebaseException) {
      soundErrorModel = _handleFirebaseError(error);
    } else if (error is PicFileError) {
      soundErrorModel = _handlePicFileError(error);
    } else {
      soundErrorModel = PossibleErrors.unknown.getErrorModel();
    }
  }
}

SoundErrorModel _handlePicFileError(PicFileError picFileError) {
  return SoundErrorModel(message: picFileError.message);
}

SoundErrorModel _handleFirebaseError(FirebaseException firebaseException) {
  return SoundErrorModel(
      code: int.tryParse(firebaseException.code) ?? 408,
      message: firebaseException.message);
}

SoundErrorModel _handleDioError(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionTimeout:
      return PossibleErrors.timeOut.getErrorModel();
    case DioExceptionType.badResponse:
      if (exception.response != null &&
          exception.response?.statusCode != null &&
          exception.response?.statusMessage != null) {
        return PossibleErrors.response.getErrorModel();
      } else {
        return PossibleErrors.unknown.getErrorModel();
      }
    default:
      return PossibleErrors.unknown.getErrorModel();
  }
}
