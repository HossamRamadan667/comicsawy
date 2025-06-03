import 'package:comicsawy/src/core/networking/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sounds_state.freezed.dart';

@freezed
abstract class SoundsState<T> with _$SoundsState<T> {
  factory SoundsState.idle() = Idle;
  factory SoundsState.success(T sounds) = Success<T>;
  factory SoundsState.fail(ErrorHandler errorHandler) = Fail<T>;
}
