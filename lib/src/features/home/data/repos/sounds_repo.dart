import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/constants/app_constants.dart';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/core/networking/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundsRepo {
  final ApiServices apiServices;
  final SharedPreferences sharedPreferences;
  SoundsRepo({required this.apiServices, required this.sharedPreferences});

  // cause not to make api call every change between pages at homeScreen
  Map<String, SoundModel>? _cachedResponse;

  /// function that returns ApiResult contains
  ///
  /// success:  {
  ///
  ///   "categoryName": [
  ///
  ///    instanceOfSoundModel (with id and is favorite),
  ///
  ///    instanceOfSoundModel (with id and is favorite),...
  ///
  ///   ],...
  ///
  /// }
  ///
  /// fail : 'error'
  Future<ApiResult<Map<String, List<SoundModel>>>>
      getSoundsSortedByCategory() async {
    ApiResult apiResult = await _callAllSounds(sortByCategory: true);
    return apiResult.when(
      success: (response) {
        // take a deep copy from response to edit it without affect on saved data
        Map<String, SoundModel> responseCopy = Map.of(response);
        Map<String, List<SoundModel>> soundsSortedByCategory =
            _sortSoundsByCategory(responseCopy);
        return ApiResult.success(soundsSortedByCategory);
      },
      fail: (errorMessage) => ApiResult.fail(errorMessage),
    );
  }

  /// function that returns ApiResult contains
  ///
  /// success: {
  ///
  ///   "categoryName": [
  ///
  ///     instanceOfSoundModel (with id and is favorite),
  ///
  ///     instanceOfSoundModel (with id and is favorite),...
  ///
  ///   ],...
  ///
  /// }
  ///
  /// fail : 'error'
  Future<ApiResult<List<SoundModel>>> getFavorites() async {
    ApiResult apiResult = await _callAllSounds();

    SharedPreferences sharedPreferences = getIt<SharedPreferences>();
    List<String>? favoritesIdsList =
        sharedPreferences.getStringList(AppConstants.favoritesListKey) ?? [];

    return apiResult.when(
      success: (response) {
        // take a deep copy from response to edit it without affect on saved data
        Map<String, SoundModel> responseCopy = Map.of(response);

        responseCopy.forEach((id, sound) {
          sound.setIsFavorite(favoritesIdsList.contains(id));
          sound.setId(id);
        });

        Map<String, SoundModel> sounds = responseCopy;
        sounds.removeWhere((id, sound) {
          return !sound.favorite!;
        });

        List<SoundModel> favoriteSoundsList = sounds.values.toList();

        return ApiResult.success(favoriteSoundsList);
      },
      fail: (errorMessage) => ApiResult.fail(errorMessage),
    );
  }

  /// Api result that returns
  ///
  /// when success:
  /// {
  ///   "id" : {
  ///      "name": "name",
  ///      "category": "categoryName",
  ///      "title": "title",
  ///      "uri": "soundUrl",
  ///   },...
  /// }
  ///
  /// when fail :
  /// 'error'
  dynamic _callAllSounds({bool? sortByCategory}) async {
    SharedPreferences sharedPreferences = getIt<SharedPreferences>();
    List<String>? favoritesIdsList =
        sharedPreferences.getStringList(AppConstants.favoritesListKey) ?? [];

    try {
      if (_cachedResponse == null) {
        Map<String, SoundModel> response = await apiServices.getAllSound();
        response.forEach((id, sound) {
          // set id to the model
          sound.setId(id);
          // set is favorite to the model
          sound.setIsFavorite(favoritesIdsList.contains(sound.id));
        });
        _cachedResponse = response;
      }

      return ApiResult.success(_cachedResponse!);
    } catch (e) {
      return ApiResult.fail(e.toString());
    }
  }

  // function takes map of sounds and return data sorted by category
  Map<String, List<SoundModel>> _sortSoundsByCategory(
      Map<String, SoundModel> soundsData) {
    Map<String, List<SoundModel>> sounds = {};

    addToMapByCategory(SoundModel sound) {
      if (sounds[sound.category] != null) {
        sounds[sound.category]!.add(sound);
      } else {
        sounds[sound.category] = [];
        sounds[sound.category]!.add(sound);
      }
    }

    soundsData.forEach((id, sound) {
      addToMapByCategory(sound);
    });

    return sounds;
  }
}
