import 'package:flutter/material.dart';
import 'package:task_manager_app/util/constant.dart';

class CustomTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: kHintTextColor,
      ),
    ),
  );
}
