import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';

class SoundControllerController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  void stopSound() async => await audioPlayer.stop();

  playSound(uri) {
    audioPlayer.setUrl(uri);
    audioPlayer.play();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
