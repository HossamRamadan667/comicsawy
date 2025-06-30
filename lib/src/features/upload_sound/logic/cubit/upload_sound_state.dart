import 'package:comicsawy/src/core/networking/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_sound_state.freezed.dart';

@freezed
abstract class UploadSoundState<T> with _$UploadSoundState<T> {
  factory UploadSoundState.idle() = Idle;
  factory UploadSoundState.invalidInput() = InvalidInput;
  factory UploadSoundState.loading() = Loading;
  factory UploadSoundState.success(T soundId) = Success<T>;
  factory UploadSoundState.fail(ErrorHandler errorHandler) = Fail<T>;
}
