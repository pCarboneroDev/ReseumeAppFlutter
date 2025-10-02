import 'package:flutter/material.dart';

class AppColors {
  // dark
  static const Color color1Dark = Color(0xFF1A1D2D);
  static const Color color2Dark = Color(0xFF2D2F4E);
  static const Color color3Dark = Color(0xFF4E4E7E);
  static const Color color4Dark = Color(0xFF8C8ECA);
  static const Color color5Dark = Color(0xFFC2C4E5);

  // light
  static const Color color1Light = Color.fromARGB(255, 252, 248, 255);
  static const Color color2Light = Color.fromARGB(255, 162, 214, 226);
  static const Color color3Light = Color.fromARGB(255, 89, 89, 146);
  static const Color color4Light = Color.fromARGB(255, 93, 92, 113);
  static const Color color5Light = Color.fromARGB(255, 14, 5, 100);

  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: color3Dark, 
        onPrimary: color5Dark,
        secondary: color2Dark,
        onSecondary: color5Dark,
        error: Colors.red,
        onError: color5Dark,
        surface: color1Dark,
        onSurface: color5Dark,
        primaryFixed: const Color.fromARGB(134, 78, 78, 126)
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
      )
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
        primaryContainer: Color.fromARGB(255, 226, 223, 255),
        onPrimary: Colors.white,
        secondary: AppColors.color4Light,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.color1Light,
        onSurface: AppColors.color5Light,
        primaryFixed: Color.fromARGB(166, 226, 223, 255)
      ),
      scaffoldBackgroundColor: AppColors.color1Light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      )
    );
  }
}