import 'package:comicsawy/controllers/favorites_controller.dart';
import '../controllers/sound_controller_controller.dart';
import 'package:comicsawy/models/sound_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoundWidget extends StatelessWidget {
  final Sound sound;
  SoundWidget({super.key, required this.sound});
  final SoundControllerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<FavoritesController>(builder: (favoritesController) {
            return IconButton(
                onPressed: () {
                  favoritesController.toggleFavorite(sound);
                },
                icon: Icon(
                  favoritesController.favorites.contains(sound.id)
                      ? Icons.star
                      : Icons.star_border,
                  color: favoritesController.favorites.contains(sound.id)
                      ? Colors.orange
                      : Colors.white30,
                ));
          }),
          Expanded(
            child: Text(
              sound.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
              onPressed: () => controller.playSound(sound.url),
              icon: const Icon(
                Icons.play_circle_outlined,
                size: 35,
              ))
        ],
      ),
    );
  }
}
