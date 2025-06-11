import 'package:comicsawy/src/features/login/data/models/login_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.freezed.dart';

@Freezed()
class LoginApiResult<T> with _$LoginApiResult<T> {
  factory LoginApiResult.success(T data) = Success<T>;
  factory LoginApiResult.fail(LoginErrorModel loginErrorModel) = Fail<T>;
}
