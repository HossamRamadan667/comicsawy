import 'package:comicsawy/src/features/login/data/models/login_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  factory LoginState.idle() = Idle;
  factory LoginState.success(T userCredential) = Success<T>;
  factory LoginState.fail(LoginErrorModel? loginErrorModel) = Fail<T>;
}
