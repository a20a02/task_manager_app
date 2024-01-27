import 'package:flutter/material.dart';

void navigatorPushReplacement(
    {required Widget screen, required BuildContext context}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ),
  );
}
