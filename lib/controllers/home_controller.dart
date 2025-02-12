import '../views/home/pages/favorites_page.dart';
import '../views/home/pages/homepage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentPage = 0;
  final List pages = [const Homepage(), FavoritesPage()];
  goToAppManager() => Get.toNamed('/addSound');

  setCurrentScreen(int index) {
    currentPage = index;
    update();
  }
}
