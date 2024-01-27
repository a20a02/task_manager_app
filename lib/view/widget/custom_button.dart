import 'package:flutter/material.dart';

import '../../util/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.minWidth,
    required this.text,
    required this.onPress,
    required this.height,
  });

  final double minWidth;
  final double height;
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: height,
      onPressed: onPress,
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
