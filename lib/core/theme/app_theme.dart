import 'package:flutter/material.dart';

// Colores principales
const Color blue100 = Color(0xFFE0EAF7);
const Color blue200 = Color(0xFFBCD4ED);
const Color blue300 = Color(0xFF468BCA);
const Color blue400 = Color(0xFF1E6DB4);
const Color blue500 = Color(0xFF235697);
const Color blue600 = Color(0xFF124375);
const Color blue700 = Color(0xFF143960);
const Color blue800 = Color(0xFF17314F);
const Color blue900 = Color(0xFF122134);

const Color aliceBlue = Color(0xFFE8EDF4);

// Colores neutros
const Color neutral100 = Color(0xFFF7F9FD);
const Color neutral200 = Color(0xFFECEDF2);
const Color neutral300 = Color(0xFFCBCFD2);
const Color neutral400 = Color(0xFF8E979F);
const Color neutral500 = Color(0xFF4F575E);
const Color neutral600 = Color(0xFF33383D);
const Color neutral700 = Color(0xFF202327);
const Color neutral800 = Color(0xFF1E1E1E);
const Color neutral900 = Color(0xFF000000);

// Colores semánticos
// Éxito
const Color success300 = Color(0xFF6CE9A6);
const Color success400 = Color(0xFF32D583);
const Color success500 = Color(0xFF12B76A);

// Advertencia
const Color warning300 = Color(0xFFFFCE8A);
const Color warning400 = Color(0xFFFFAA33);
const Color warning500 = Color(0xFFE88800);

// Error
const Color error300 = Color(0xFFFDA19B);
const Color error400 = Color(0xFFF97066);
const Color error500 = Color(0xFFF04438);

const Color primaryColor = Color(0xFFFAFAFA);
const Color secondaryColor = Color(0xFFFAFAFA);
const Color accentColor = Color(0xFFFAFAFA);

const Color black = Colors.black;
const Color white = Colors.white;

const FontWeight fwB = FontWeight.w700;
const FontWeight fwSb = FontWeight.w600;
const FontWeight fwM = FontWeight.w500;
const FontWeight fwR = FontWeight.w400;

const Color _seedColor = blue500;

const TextStyle disBigTS =
    TextStyle(fontFamily: 'SF Pro Display', fontSize: 32, fontWeight: fwB, letterSpacing: -0.4, height: 0);
const TextStyle disLargeTS =
    TextStyle(fontFamily: 'SF Pro Display', fontSize: 24, fontWeight: fwSb, letterSpacing: -0.4, height: 0);
const TextStyle titleTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 20, fontWeight: fwB, letterSpacing: -0.4, height: 0);
const TextStyle secHeaderTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 17, fontWeight: fwSb, letterSpacing: -0.4, height: 0);
const TextStyle subtitleTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: fwSb, letterSpacing: -0.4, height: 0);
const TextStyle bodyLargeBTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: fwB, letterSpacing: -0.4, height: 0);
const TextStyle bodyLargeRTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: fwR, letterSpacing: -0.4, height: 0);
const TextStyle bodySmallBTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 14, fontWeight: fwB, letterSpacing: -0.4, height: 0);
const TextStyle bodySmallRTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 14, fontWeight: fwR, letterSpacing: -0.4, height: 0);
const TextStyle buttonsTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 17, fontWeight: fwR, letterSpacing: -0.4, height: 0);
const TextStyle largeRegularTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 16, fontWeight: fwM, letterSpacing: -0.4, height: 0);
const TextStyle smallRegularTS =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 14, fontWeight: fwR, letterSpacing: -0.4, height: 0);

const TextTheme _textTheme = TextTheme(
  displayLarge: disBigTS,
  displayMedium: disLargeTS,
  headlineLarge: titleTS,
  headlineMedium: secHeaderTS,
  headlineSmall: subtitleTS,
  titleLarge: bodyLargeBTS,
  titleMedium: bodyLargeRTS,
  titleSmall: bodySmallBTS,
  bodyLarge: bodySmallRTS,
  bodyMedium: buttonsTS,
  bodySmall: largeRegularTS,
  labelMedium: smallRegularTS,
);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor: primaryColor,
        colorSchemeSeed: _seedColor,
        textTheme: _textTheme,
      );
}

extension UIThemeExtension on BuildContext {
  //* TEXT COLOR : GRAY 700 (0xFF374151) & GREEN 500 (0xFF516665)

//  TextStyle get s48w7gray700 => Theme.of(this).textTheme.displayLarge!;

  // * Size screen
  double get widthMq => MediaQuery.sizeOf(this).width;
  double get heightMq => MediaQuery.sizeOf(this).height;
}
