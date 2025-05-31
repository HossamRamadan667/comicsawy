import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/routing/routes.dart';
import 'package:comicsawy/src/features/home/logic/cubit/favorite_page_cubit.dart';
import 'package:comicsawy/src/features/home/logic/cubit/home_page_cubit.dart';
import 'package:comicsawy/src/features/home/ui/home_screen.dart';
import 'package:comicsawy/src/features/home/ui/pages/favorites_page.dart';
import 'package:comicsawy/src/features/home/ui/pages/home_page.dart';
import 'package:comicsawy/src/features/upload_sound/ui/upload_sound_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => Home(
            homePage: BlocProvider<HomePageCubit>.value(
              value: getIt<HomePageCubit>(),
              child: const HomePage(),
            ),
            favoritesPage: BlocProvider<FavoritesPageCubit>.value(
              value: getIt<FavoritesPageCubit>(),
              child: const FavoritesPage(),
            ),
          ),
        );
      case AppRoutes.uploadSound:
        return MaterialPageRoute(
          builder: (context) => const UploadSoundScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Center(
                child: Text("no Screen on ${routeSettings.name} route")));
    }
  }
}
