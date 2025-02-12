import 'package:comicsawy/models/sound_model.dart';
import 'package:comicsawy/data/secured_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Sound>> getSoundsData() async {
  List<Sound> sounds = [];
  Uri url = Uri.https(dbUrl, 'sounds.json');
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
