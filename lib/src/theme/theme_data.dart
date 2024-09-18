import 'package:flutter/material.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surfaceTint,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        dividerColor: Colors.blueAccent,
        headerBackgroundColor: Colors.blueAccent,
        headerForegroundColor: Colors.white,
      ),
      // primaryTextTheme: TextTheme(
      //    backgroundColor: Colors.white,
      //   dividerColor: Colors.blueAccent,
      //   headerBackgroundColor: Colors.blueAccent,
      //   headerForegroundColor: Colors.white,
      // ),
      //),
      //bottomNavigationBarTheme: BottomNavigationBarThemeData(),
      //inputDecorationTheme: InputDecorationTheme(TextStyle(fontSize: 10))),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFD47E2E),
    onSecondary: Color(0xFF672332),
    error: Colors.redAccent,
    onError: Color.fromARGB(255, 215, 49, 49),
    surface: Color(0xFFBAD6E8),
    onSurface: Color(0xFF372824),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    surface: Color(0xFF1F1929),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Color.fromARGB(255, 88, 56, 56),
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
