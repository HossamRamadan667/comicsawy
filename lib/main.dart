import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/routing/router.dart';
import 'package:flutter/material.dart';

import 'comicsawy_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(ComicsawyApp(appRouter: AppRouter()));
}
