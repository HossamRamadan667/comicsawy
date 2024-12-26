import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getFavoritesData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? favoritesData = prefs.getStringList('favorites');
  return favoritesData ?? [];
}

addFavorite(String soundId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = await getFavoritesData()
    ..add(soundId);
  prefs.setStringList('favorites', data);
}

removeFavorite(String soundId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = await getFavoritesData()
    ..remove(soundId);
  prefs.setStringList('favorites', data);
}
