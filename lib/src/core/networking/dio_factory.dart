import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? _dio;

  static getDio() {
    const Duration timeout = Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();

      _dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;

      _addDioInterceptors();

      return _dio;
    } else {
      return _dio;
    }
  }

  static _addDioInterceptors() {
    _dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }
}
