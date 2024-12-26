import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:comicsawy/data/sounds_data.dart';

class SoundsNotifier extends StateNotifier<List<Sound>> {
  SoundsNotifier() : super([]) {
    getSoundsData().then((value) => state = value);
  }
}

final soundsProvider = StateNotifierProvider<SoundsNotifier, List<Sound>>(
    (ref) => SoundsNotifier());
