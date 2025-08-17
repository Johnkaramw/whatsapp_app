import 'package:flutter/material.dart';

class AppTheme {
  static const Color _whatsGreen = Color(0xFF128C7E);
  static const Color _whatsGreenDark = Color(0xFF075E54);

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _whatsGreen,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
        backgroundColor: _whatsGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _whatsGreen,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      scaffoldBackgroundColor: Color(0xFFF8F9FA),
      dividerColor: Color(0xFFE6E6E6),
    );
  }

  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _whatsGreenDark,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
        backgroundColor: _whatsGreenDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _whatsGreenDark,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      scaffoldBackgroundColor: Color(0xFF0B141A),
      dividerColor: Color(0xFF233138),
    );
  }
}
