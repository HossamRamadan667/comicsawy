import 'package:comicsawy/controllers/sounds_controller.dart';
import 'package:comicsawy/components/sound_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final SoundsController soundsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(builder: (a) {
      var s = soundsController.sounds
          .where((element) => a.favorites.contains(element.id))
          .toList();
      return Directionality(
          textDirection: TextDirection.ltr,
          child: a.favorites.isEmpty
              ? const Center(
                  child: Text('لسه فاضيه'),
                )
              : ListView.builder(
                  itemCount: a.favorites.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        bottom: index + 1 == a.favorites.length ? 80 : 0),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SoundWidget(sound: s[index]),
                    )),
                  ),
                ));
    });
  }
}
