import 'package:comicsawy/controllers/sounds_controller.dart';
import 'package:get/get.dart';
import '../../../components/category_card.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SoundsController>(builder: (soundsController) {
      return Directionality(
          textDirection: TextDirection.ltr,
          child: soundsController.categories.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: soundsController.categories.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        bottom: index + 1 == soundsController.categories.length
                            ? 80
                            : 0),
                    child: CategoryCard(
                      sounds: soundsController.sounds
                          .where((sound) =>
                              sound.category ==
                              soundsController.categories[index])
                          .toList(),
                      category: soundsController.categories[index],
                    ),
                  ),
                ));
    });
  }
}
