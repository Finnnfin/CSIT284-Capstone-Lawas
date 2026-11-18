
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF183D36);
  static const Color background = Color(0xFFF6F7F5);
  static const Color cardWhite = Colors.white;
  static const Color textDark = Color(0xFF26332E);

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
