import 'package:comicsawy/src/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => Home());
      default:
        return MaterialPageRoute(
            builder: (context) => Center(
                child: Text("no Screen on ${routeSettings.name} route")));
    }
  }
}
