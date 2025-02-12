import 'package:comicsawy/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddSoundMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (auth.currentUser == null) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
