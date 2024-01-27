import 'package:flutter/material.dart';
import 'package:task_manager_app/util/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onPress,
    required this.icon,
    required this.text,
  });

  final void Function() onPress;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.165,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: IconButton(
            onPressed: onPress,
            icon: Icon(
              icon,
              size: 40,
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
