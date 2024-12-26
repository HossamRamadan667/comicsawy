import 'package:comicsawy/providers/sounds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sound_model.dart';

class CategoriesStateNotifier extends StateNotifier<List<String>> {
  CategoriesStateNotifier(List<Sound> sounds) : super([]) {
    List<String> categories = sounds.map((e) => e.category).toSet().toList()
      ..sort();
    state = categories;
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesStateNotifier, List<String>>(
  (ref) => CategoriesStateNotifier(ref.watch(soundsProvider)),
);
