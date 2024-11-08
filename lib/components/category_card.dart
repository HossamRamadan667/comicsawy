import 'package:comicsawy/components/sound_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:comicsawy/firebase.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String category;
  final AudioPlayer soundPlayer;
  const CategoryCard(
      {super.key, required this.category, required this.soundPlayer});

  @override
  State<CategoryCard> createState() => _CategoryCard();
}

class _CategoryCard extends State<CategoryCard> {
  List<dynamic> storedSounds = [];
  List<dynamic> sounds = [];
  bool shown = false;

  void toggle() {
    setState(() {
      sounds = shown ? [] : storedSounds;
      shown = !shown;
    });
  }

  Future<List> getData() async {
    final categoryRef = storage.ref().child("categories/${widget.category}");

    List<Future<Map<String, String>>> data =
        (await categoryRef.listAll()).items.map((category) async {
      //remove .mp3
      String name = category.name.substring(0, category.name.length - 4);

      // get download url from path
      String uri = await FirebaseStorage.instance
          .ref()
          .child(category.fullPath)
          .getDownloadURL();

      return {'name': name, 'uri': uri};
    }).toList();

    return Future.wait([...data]);
  }

  @override
  void initState() {
    super.initState();
    getData().then((sounds) => storedSounds = sounds);
  }

  Function? playSound(uri) {
    widget.soundPlayer.setUrl(uri);
    widget.soundPlayer.play();
    return null;
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
                            onPressed: toggle,
                            icon: Icon(shown
                                ? Icons.arrow_right_rounded
                                : Icons.arrow_drop_down_rounded))
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Colors.white30))),
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: sounds
                            .map((sound) => SoundWidget(
                                  name: sound['name'],
                                  onPlay: () {
                                    playSound(sound["uri"]);
                                  },
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
}
