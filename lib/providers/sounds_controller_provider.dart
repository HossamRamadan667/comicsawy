import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class SoundControllerNotifier extends StateNotifier<AudioPlayer> {
  SoundControllerNotifier() : super(AudioPlayer());

  void stopSound() async => await state.stop();

  playSound(uri) {
    state.setUrl(uri);
    state.play();
  }
}

final soundControllerProvider =
    StateNotifierProvider<SoundControllerNotifier, AudioPlayer>(
        (ref) => SoundControllerNotifier());
