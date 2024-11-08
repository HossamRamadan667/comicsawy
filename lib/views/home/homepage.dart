import 'package:comicsawy/components/category_card.dart';
import 'package:comicsawy/firebase.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<StatefulWidget> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  List<String> categories = [];
  AudioPlayer soundPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    final categoriesRef = storage.ref().child("categories");
    categoriesRef.listAll().then((listResult) => setState(() {
          categories = listResult.prefixes.map((a) => a.name).toList();
        }));
  }

  @override
  void dispose() {
    soundPlayer.dispose();
    super.dispose();
  }

  void stopSound() async {
    await soundPlayer.stop();
  }

  @override
  Widget build(BuildContext context) => Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'كوميكساوي',
            style: TextStyle(fontFamily: 'mikhak'),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: stopSound,
          child: const Icon(Icons.stop),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...categories
                  .map((category) => CategoryCard(
                      category: category, soundPlayer: soundPlayer))
                  .toList(),
              // just add empty space for floating action button
              Container(
                height: 80,
              )
            ],
          ),
        ),
      ));
}
