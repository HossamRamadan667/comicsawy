import 'package:comicsawy/models/sound_model.dart';
import '../data/favorites_data.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  List<String> favorites = [];

  @override
  void onInit() async {
    favorites = await getFavoritesData();
    super.onInit();
  }

  toggleFavorite(Sound sound) {
    if (favorites.contains(sound.id)) {
      removeFavorite(sound.id);
      favorites = favorites.where((element) => element != sound.id).toList();
    } else {
      addFavorite(sound.id);
      favorites = [...favorites, sound.id];
    }
    update();
  }
}
