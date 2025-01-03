import 'package:flutter/material.dart';

const Color blue500 = Color(0xFF235697); 

const Color seedColor = blue500;

class AppTheme {
  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: seedColor,
       // fontFamily: 'Geist',
       // textTheme: _textTheme,
       // scaffoldBackgroundColor: white,
      );
}