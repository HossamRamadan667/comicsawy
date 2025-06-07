import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'comicsawy_app.dart';
import 'private_firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ComicsawyApp(appRouter: AppRouter()));
}
