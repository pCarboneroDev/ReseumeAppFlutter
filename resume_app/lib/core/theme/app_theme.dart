import 'package:flutter/material.dart';
import 'package:resume_app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';

class AppColors {
  // dark
  static const Color color1Dark = Color(0xFF1A1D2D);
  static const Color color2Dark = Color(0xFF2D2F4E);
  static const Color color3Dark = Color(0xFF4E4E7E);
  static const Color color4Dark = Color(0xFF8C8ECA);
  static const Color color5Dark = Color(0xFFC2C4E5);

  // light
  static const Color color1Light = Colors.white;
  static const Color color2Light = Colors.grey;
  static const Color color3Light = Colors.blueGrey;
  static const Color color4Light = Colors.blueAccent;
  static const Color color5Light = Colors.black;

  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: color3Dark, // Color principal
        onPrimary: Colors.white,
        secondary: color4Dark,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: color1Dark,
        onSurface: color5Dark,
      ),
      scaffoldBackgroundColor: color1Dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: color2Dark,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class AppTheme {
  static Future<ThemeData> getTheme(bool isDark) async {
    if (isDark) {
      return AppColors.darkTheme();
    }

    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.color3Light,
        onPrimary: Colors.black,
        secondary: AppColors.color4Light,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.color1Light,
        onSurface: AppColors.color5Light,
      ),
      scaffoldBackgroundColor: AppColors.color1Light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}
