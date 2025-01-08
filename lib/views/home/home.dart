import 'package:comicsawy/providers/sounds_controller_provider.dart';
import 'package:comicsawy/providers/navigation_bar_provider.dart';
import 'package:comicsawy/views/home/pages/favorites_page.dart';
import 'package:comicsawy/views/home/pages/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/views/add_sound.dart';
import 'package:comicsawy/views/login.dart';
import 'package:comicsawy/firebase.dart';
import 'package:flutter/material.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final List<ConsumerStatefulWidget> pages = const [
    Homepage(),
    FavoritesPage()
  ];

  @override
  void dispose() {
    ref.read(soundControllerProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentPage = ref.watch(navigationProvider);

    NavigationBarNotifier currentPageController =
        ref.read(navigationProvider.notifier);

    return Scaffold(
      body: pages.elementAt(currentPage),
      appBar: AppBar(
        title: const Text(
          'كوميكساوي',
          style: TextStyle(fontFamily: 'mikhak'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return auth.currentUser == null
                          ? const Login()
                          : const AddSound();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(soundControllerProvider.notifier).stopSound(),
        child: const Icon(Icons.stop),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          currentIndex: currentPage,
          onTap: (index) {
            currentPageController.setCurrentScreen(index);
          },
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
  }
}
