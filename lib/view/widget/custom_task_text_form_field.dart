import 'package:flutter/material.dart';

import '../../util/constant.dart';

class CustomTaskTextFormField extends StatelessWidget {
  const CustomTaskTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16),
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
