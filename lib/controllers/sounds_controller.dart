import 'package:comicsawy/models/sound_model.dart';
import '../data/sounds_data.dart';
import 'package:get/get.dart';

class SoundsController extends GetxController {
  List<String> categories = [];
  List<Sound> sounds = [];

  @override
  void onInit() async {
    List<Sound> soundsData = await getSoundsData();
    sounds = soundsData;
    categories = soundsData.map((e) => e.category).toSet().toList()..sort();
    update();
    super.onInit();
  }
}
