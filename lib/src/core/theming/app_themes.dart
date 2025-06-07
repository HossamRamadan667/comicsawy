import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:comicsawy/src/core/theming/text_styles.dart';
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
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.gray,
          width: 1.3,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkGray,
          width: 1.3,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 1.3,
        ),
      ),
      labelStyle: TextStyles.font17LightGrayW400,
    ),
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    fontFamily: 'khebrat',
  );
}
