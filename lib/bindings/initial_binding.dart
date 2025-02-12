import 'package:comicsawy/controllers/sound_controller_controller.dart';
import 'package:comicsawy/controllers/favorites_controller.dart';
import 'package:comicsawy/controllers/sounds_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SoundControllerController(), fenix: true);
    Get.put(SoundsController(), permanent: true);
    Get.put(FavoritesController(), permanent: true);
  }
}
