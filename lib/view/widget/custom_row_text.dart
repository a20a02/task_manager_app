import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Enter Here',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
