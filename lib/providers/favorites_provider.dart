import 'package:comicsawy/providers/sounds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/data/favorites_data.dart';
import 'package:comicsawy/models/sound_model.dart';

class FavoritesNotifier extends StateNotifier<List<Sound>> {
  FavoritesNotifier(List<Sound> sounds) : super([]) {
    getFavoritesData().then((favoritesData) => state =
        sounds.where((sound) => favoritesData.contains(sound.id)).toList());
  }

  toggleFavorite(Sound sound) {
    if (state.contains(sound)) {
      removeFavorite(sound.id);
      state = state.where((element) => element != sound).toList();
    } else {
      addFavorite(sound.id);
      state = [...state, sound];
    }
  }
}

StateNotifierProvider<FavoritesNotifier, List<Sound>> favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Sound>>(
  (ref) => FavoritesNotifier(ref.watch(soundsProvider)),
);
