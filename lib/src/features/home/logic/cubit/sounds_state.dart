import 'package:freezed_annotation/freezed_annotation.dart';

part 'sounds_state.freezed.dart';

@freezed
abstract class SoundsState<T> with _$SoundsState<T> {
  factory SoundsState.idle() = Idle;
  factory SoundsState.success(T sounds) = Success<T>;
  factory SoundsState.fail(String errorMessage) = Fail<T>;
}
