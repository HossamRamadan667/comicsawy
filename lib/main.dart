import 'package:comicsawy/views/home/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:comicsawy/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 9, 0, 131),
              brightness: Brightness.dark,
            ),
            fontFamily: 'khebrat'),
        home: const Homepage(),
      );
}
