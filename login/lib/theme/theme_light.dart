

import 'package:flutter/material.dart';

class LightTheme {

  late ThemeData theme;

  LightTheme(){

    theme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline4: TextStyle(color: ThemeColors._white,fontWeight: FontWeight.bold),
        subtitle1: TextStyle(color: ThemeColors._white),
        subtitle2: TextStyle(color: ThemeColors.ewa)
      ),
      iconTheme: IconThemeData(
        color: ThemeColors._black
      )
    );
  }
}

class ThemeColors  {
  static final Color _black = Colors.black;
  static final Color _white = Colors.white;
  static final Color transparent = Colors.transparent;
  static final Color ewa = Color.fromARGB(255, 69, 64, 67).withOpacity(0.7);
}