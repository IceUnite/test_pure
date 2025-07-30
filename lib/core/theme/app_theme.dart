import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme get ubuntuTextTheme {
    return const TextTheme(
      displayLarge: TextStyle(fontFamily: 'Ubuntu'),
      displayMedium: TextStyle(fontFamily: 'Ubuntu'),
      displaySmall: TextStyle(fontFamily: 'Ubuntu'),
      bodyLarge: TextStyle(fontFamily: 'Ubuntu'),
      bodyMedium: TextStyle(fontFamily: 'Ubuntu'),
      titleMedium: TextStyle(fontFamily: 'Ubuntu'),
      titleSmall: TextStyle(fontFamily: 'Ubuntu'),
      labelLarge: TextStyle(fontFamily: 'Ubuntu'),
      bodySmall: TextStyle(fontFamily: 'Ubuntu'),
      labelSmall: TextStyle(fontFamily: 'Ubuntu'),
    );
  }
  static final darkTheme = ThemeData(
    primaryColor: const Color(0xFF4CAF50),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFF4CAF50),
      unselectedItemColor: Colors.grey,
    ),
  );
}