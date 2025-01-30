import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicsawy/themes/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:comicsawy/firebase_options.dart';
import 'package:comicsawy/views/home/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,
        home: const Home(),
      );
}
