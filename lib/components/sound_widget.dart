import 'package:comicsawy/providers/sounds_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:flutter/material.dart';

class SoundWidget extends ConsumerWidget {
  final Sound sound;
  const SoundWidget({super.key, required this.sound});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Sound> favorites = ref.watch(favoritesProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                ref.read(favoritesProvider.notifier).toggleFavorite(sound);
              },
              icon: Icon(
                favorites.contains(sound) ? Icons.star : Icons.star_border,
                color:
                    favorites.contains(sound) ? Colors.orange : Colors.white30,
              )),
          Expanded(
            child: Text(
              sound.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
              onPressed: () => ref
                  .read(soundControllerProvider.notifier)
                  .playSound(sound.url),
              icon: const Icon(
                Icons.play_circle_outlined,
                size: 35,
              ))
        ],
      ),
    );
  }
}
