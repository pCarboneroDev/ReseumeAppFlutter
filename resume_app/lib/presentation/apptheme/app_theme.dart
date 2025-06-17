import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.amber
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurpleAccent
  );
}