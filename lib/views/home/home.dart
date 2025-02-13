import 'package:comicsawy/controllers/sound_controller_controller.dart';
import 'package:comicsawy/controllers/home_controller.dart';
import 'package:comicsawy/controllers/sounds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final SoundControllerController soundController = Get.find();
  final SoundsController soundsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            body: homeController.pages.elementAt(homeController.currentPage),
            appBar: AppBar(
              title: const Text(
                'كوميكساوي',
                style: TextStyle(fontFamily: 'mikhak'),
              ),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: soundController.stopSound,
              child: const Icon(Icons.stop),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 30,
                currentIndex: homeController.currentPage,
                onTap: homeController.setCurrentScreen,
                items: const [
                  BottomNavigationBarItem(
                      label: 'الرئيسيه',
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(
                        Icons.home_filled,
                        color: Colors.indigo,
                      )),
                  BottomNavigationBarItem(
                      label: 'المفضله',
                      icon: Icon(Icons.star_border),
                      activeIcon: Icon(
                        Icons.star,
                        color: Colors.orange,
                      ))
                ]),
          );
        });
  }
}
