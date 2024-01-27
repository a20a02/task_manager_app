import 'package:flutter/material.dart';
import 'package:task_manager_app/util/constant.dart';

class CustomBackgoundWidget extends StatelessWidget {
  const CustomBackgoundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kBackgoundColor,
                kSecondaryBackgoundColor,
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
