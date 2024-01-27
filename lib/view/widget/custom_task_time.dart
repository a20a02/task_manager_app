import 'package:flutter/material.dart';

import '../../util/constant.dart';

class CustomTaskTime extends StatelessWidget {
  const CustomTaskTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: kHintTextColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x7F161A30),
            blurRadius: 6,
            offset: Offset(0, 4),
            spreadRadius: 6,
          )
        ],
      ),
      alignment: Alignment.center,
      child: const RotatedBox(
        quarterTurns: 3,
        child: Text(
          '6:30 PM\nMON',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2D2C29),
            fontSize: 16,
            letterSpacing: 1.60,
          ),
        ),
      ),
    );
  }
}
