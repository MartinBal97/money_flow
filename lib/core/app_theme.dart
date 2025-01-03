import 'package:flutter/material.dart';

const Color blue500 = Color(0xFF235697);

const Color black = Colors.black;
const Color white = Colors.white;

const FontWeight b = FontWeight.w700;
const FontWeight sb = FontWeight.w600;
const FontWeight m = FontWeight.w500;
const FontWeight r = FontWeight.w400;

const Color _seedColor = blue500;

const TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(fontFamily: 'SF Pro Display', fontSize: 48, fontWeight: b),
  displayMedium: TextStyle(fontFamily: 'SF Pro Display', fontSize: 30, fontWeight: b),
  displaySmall: TextStyle(fontFamily: 'SF Pro Display', fontSize: 24, fontWeight: b),
  headlineLarge: TextStyle(fontFamily: 'SF Pro Text', fontSize: 20, fontWeight: sb),
  headlineMedium: TextStyle(fontFamily: 'SF Pro Text', fontSize: 20, fontWeight: r),
  headlineSmall: TextStyle(fontFamily: 'SF Pro Text', fontSize: 18, fontWeight: b),
  titleLarge: TextStyle(fontFamily: 'SF Pro Text', fontSize: 18, fontWeight: r),
  titleMedium: TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: b),
  titleSmall: TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: r),
  bodyLarge: TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: b),
  bodyMedium: TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: sb),
  bodySmall: TextStyle(fontFamily: 'SF Pro Text', fontSize: 14, fontWeight: sb),
  labelLarge: TextStyle(fontFamily: 'SF Pro Text', fontSize: 14, fontWeight: r),
  labelMedium: TextStyle(fontFamily: 'SF Pro Text', fontSize: 12, fontWeight: sb),
  labelSmall: TextStyle(fontFamily: 'SF Pro Text', fontSize: 12, fontWeight: r),
);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    )),
  ),
);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: _seedColor,
        textTheme: _textTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
      );
}
