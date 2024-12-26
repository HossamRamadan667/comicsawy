import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comicsawy/models/sound_model.dart';

Future<List<Sound>> getSoundsData() async {
  List<Sound> sounds = [];
  Uri url =
      Uri.https('comicsawy-8b155-default-rtdb.firebaseio.com', 'sounds.json');
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body).entries.toList();
    sounds = data
        .map((e) => Sound(
            id: e.key,
            name: e.value['name'],
            url: e.value['uri'],
            category: e.value['category'],
            favorite: false))
        .toList();
  }

  return sounds;
}
