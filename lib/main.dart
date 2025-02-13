import 'package:comicsawy/middleware/add_sound_middleware.dart';
import 'package:comicsawy/bindings/initial_binding.dart';
import 'package:comicsawy/themes/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:comicsawy/firebase_options.dart';
import 'package:comicsawy/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,
        initialBinding: InitialBinding(),
        initialRoute: '/',
        getPages: [GetPage(name: '/', page: () => Home())],
      );
}
