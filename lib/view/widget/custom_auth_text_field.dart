import 'package:flutter/material.dart';

import '../../util/constant.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.validator,
  });

  final String hintText;
  final Function(String) onChange;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        filled: true,
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kHintTextColor),
      ),
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
