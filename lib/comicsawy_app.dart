import 'package:comicsawy/src/core/theming/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comicsawy/src/core/routing/router.dart';
import 'package:comicsawy/src/core/routing/routes.dart';
import 'package:flutter/material.dart';

class ComicsawyApp extends StatelessWidget {
  final AppRouter appRouter;
  const ComicsawyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: AppThemes.dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
