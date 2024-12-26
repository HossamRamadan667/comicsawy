import 'package:comicsawy/providers/categories_provider.dart';
import 'package:comicsawy/providers/sounds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/models/sound_model.dart';
import '../../../components/category_card.dart';
import 'package:flutter/material.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List categories = ref.watch(categoriesProvider);
    List<Sound> allSounds = ref.watch(soundsProvider);

    return Directionality(
        textDirection: TextDirection.ltr,
        child: ref.watch(categoriesProvider).isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                      bottom: index + 1 == categories.length ? 80 : 0),
                  child: CategoryCard(
                    sounds: allSounds
                        .where((sound) => sound.category == categories[index])
                        .toList(),
                    category: categories[index],
                  ),
                ),
              ));
  }
}
