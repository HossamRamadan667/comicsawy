import 'package:comicsawy/src/core/constants/app_constants.dart';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/core/networking/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/sound_model.dart';

class SoundsRepo {
  final ApiServices apiServices;
  final SharedPreferences sharedPreferences;
  SoundsRepo({required this.apiServices, required this.sharedPreferences});

  Future<ApiResult<Map<String, List<SoundModel>>>> getAllSound() async {
    try {
      Map<String, List<SoundModel>> sounds = {};

      addToMapByCategory(SoundModel sound) {
        if (sounds[sound.category] != null) {
          sounds[sound.category]!.add(sound);
        } else {
          sounds[sound.category] = [];
          sounds[sound.category]!.add(sound);
        }
      }

      List<String>? favoriteIdsList =
          sharedPreferences.getStringList(AppConstants.favoritesListKey);

      Map<String, SoundModel> response = await apiServices.getAllSound();

      response.forEach((id, sound) {
        // set is id to the model
        sound.setId(id);

        // set is Favorite to the model
        if (favoriteIdsList != null && favoriteIdsList.contains(id)) {
          sound.setIsFavorite(true);
        }

        addToMapByCategory(sound);
      });

      return ApiResult.success(sounds);
    } catch (e) {
      return ApiResult.fail(
          // TODO: change it with real Error message
          e.toString());
    }
  }
}
