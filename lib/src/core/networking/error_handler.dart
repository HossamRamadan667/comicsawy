import 'package:comicsawy/src/features/home/data/models/sound_error_model.dart';
import 'package:dio/dio.dart';

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
      soundErrorModel = _handleError(error);
    } else {
      soundErrorModel = PossibleErrors.unknown.getErrorModel();
    }
  }
}

SoundErrorModel _handleError(DioException exception) {
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
