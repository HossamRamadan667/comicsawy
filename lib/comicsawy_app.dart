import 'package:comicsawy/src/core/routing/router.dart';
import 'package:comicsawy/src/core/routing/routes.dart';
import 'package:flutter/material.dart';

class ComicsawyApp extends StatelessWidget {
  final AppRouter appRouter;
  const ComicsawyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
