import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
    ),
    fontFamily: 'khebrat',
  );
}
