import 'package:comicsawy/components/sound_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends ConsumerStatefulWidget {
  final String category;
  final List<Sound> sounds;
  const CategoryCard({
    super.key,
    required this.sounds,
    required this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryCard();
}

class _CategoryCard extends ConsumerState<CategoryCard> {
  List<Sound> storedSounds = [];
  List<Sound> sounds = [];
  bool shown = false;

  void toggle(wid) {
    setState(() {
      sounds = shown ? [] : wid.sounds;
      shown = !shown;
    });
  }

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.category,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                            onPressed: () => toggle(widget),
                            icon: Icon(shown
                                ? Icons.arrow_right_rounded
                                : Icons.arrow_drop_down_rounded))
                      ],
                    ),
                    shown ? const Divider() : const SizedBox(),
                    Column(
                      children: sounds
                          .map((sound) => SoundWidget(sound: sound))
                          .toList(),
                    )
                  ],
                ),
              ),
            )),
      );
}
