import 'package:comicsawy/src/features/home/data/sound_model.dart';
import 'package:comicsawy/src/features/home/widgets/sound_by_category_drop_down.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<Map<String, dynamic>> x = [
    {
      "category": "ميكس",
      "name": "انت يا جحش",
      "uri":
          "https://firebasestorage.googleapis.com/v0/b/comicsawy-8b155.appspot.com/o/categories%2F%D9%85%D9%8A%D9%83%D8%B3%2F%D8%A7%D9%86%D8%AA%20%D9%8A%D8%A7%20%D8%AC%D8%AD%D8%B4.mp3?alt=media&token=937df9b2-22d8-41e3-80a8-4aa1708f0d5f"
    },
    {
      "category": "ميكس",
      "name": "أعوذ بالله",
      "uri":
          "https://firebasestorage.googleapis.com/v0/b/comicsawy-8b155.appspot.com/o/categories%2F%D9%85%D9%8A%D9%83%D8%B3%2F%D8%A3%D8%B9%D9%88%D8%B0%20%D8%A8%D8%A7%D9%84%D9%84%D9%87.mp3?alt=media&token=109aae6e-85b0-47c1-a3f1-2faf116f45e6"
    },
  ];

  List<SoundModel> s() {
    return x.map((e) => SoundModel.fromJson(e)).toList();
  }

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SoundByCategoryDropDown(
                soundsByCategory: s(), category: ' category'),
          ],
        ),
      ),
    );
  }
}
