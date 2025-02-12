import 'package:firebase_storage/firebase_storage.dart';
import 'package:comicsawy/data/secured_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:comicsawy/firebase.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class AddSoundController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String title = '';
  String fileName = 'no file selected';
  String? category;
  late String _uri = '';
  File? _soundFile;
  late Reference _fileRef;
  bool isNewCategory = false;

  toggleIsNewCategory() {
    isNewCategory = !isNewCategory;
    category = null;
    update();
  }

  _showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
    ));
  }

  picFile() async {
    var pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['mp3']);

    if (pickedFile != null) {
      _soundFile = File(pickedFile.files.single.path!);
      fileName = pickedFile.files.single.name;
      update();
    }
  }

  String? categoryValidator(value) {
    if (value!.trim().isEmpty) {
      return 'cant be empty';
    }
    return null;
  }

  String? validator(value, sounds) {
    if (value!.trim().isEmpty) {
      return 'cant be empty';
    }

    if (sounds
        .where((sound) => sound.category == category && sound.name == value)
        .isNotEmpty) {
      return 'Already exist';
    }

    return null;
  }

  Future<String> _uploadFile() async {
    late String url;
    _fileRef = storage.ref('categories/$category/').child('$title.mp3')
      ..updateMetadata(SettableMetadata(contentType: 'audio/mpeg'));

    if (_soundFile == null) {
      throw Exception('select File first');
    }

    await _fileRef.putFile(_soundFile!).then((p0) async {
      url = await _fileRef.getDownloadURL();
    }).onError((error, stackTrace) {
      throw Exception(error.toString());
    });
    return url;
  }

  Future<http.Response> _postSound() async {
    Uri url = Uri.https(dbUrl, 'sounds.json');
    http.Response response = await http
        .post(url,
            headers: {'Content-Type': 'application/json'},
            body:
                json.encode({"category": category, "name": title, "uri": _uri}))
        .onError((error, stackTrace) {
      throw Exception(error.toString());
    });
    return response;
  }

  submit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      _uploadFile().then((uri) {
        _uri = uri;
        _postSound().then((response) {
          if (response.statusCode == 200) {
            Navigator.pop(context);
          } else {
            _fileRef.delete();
            _showSnackbar(
                json.decode(response.body)['error']['message'], context);
          }
        }).onError((error, stackTrace) {
          _showSnackbar(error.toString(), context);
        });
      }).onError((error, stackTrace) {
        _showSnackbar(error.toString(), context);
      });
    }
  }
}
