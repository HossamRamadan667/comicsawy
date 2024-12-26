import 'package:comicsawy/providers/favorites_provider.dart';
import 'package:comicsawy/components/sound_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Sound> favoritesSounds = ref.watch(favoritesProvider);

    return Directionality(
        textDirection: TextDirection.ltr,
        child: favoritesSounds.isEmpty
            ? const Center(
                child: Text('لسه فاضيه'),
              )
            : ListView.builder(
                itemCount: favoritesSounds.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                      bottom: index + 1 == favoritesSounds.length ? 80 : 0),
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SoundWidget(sound: favoritesSounds[index]),
                  )),
                ),
              ));
  }
}
