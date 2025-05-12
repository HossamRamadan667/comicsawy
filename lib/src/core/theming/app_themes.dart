import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(color: AppColors.gray, size: 30),
          showSelectedLabels: true,
          showUnselectedLabels: false);

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
    ),
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    fontFamily: 'khebrat',
  );
}
