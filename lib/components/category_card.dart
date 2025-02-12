import 'package:comicsawy/components/sound_widget.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String category;
  final List<Sound> sounds;
  const CategoryCard({
    super.key,
    required this.sounds,
    required this.category,
  });

  @override
  State<StatefulWidget> createState() => _CategoryCard();
}

class _CategoryCard extends State<CategoryCard> {
  bool shown = false;

  void toggle() {
    setState(() {
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
                            onPressed: () => toggle(),
                            icon: Icon(shown
                                ? Icons.arrow_right_rounded
                                : Icons.arrow_drop_down_rounded))
                      ],
                    ),
                    Column(
                      children: shown
                          ? [
                              const Divider(),
                              ...widget.sounds
                                  .map((sound) => SoundWidget(sound: sound))
                                  .toList()
                            ]
                          : [],
                    )
                  ],
                ),
              ),
            )),
      );
}
