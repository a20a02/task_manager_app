import 'package:flutter/material.dart';
import 'package:task_manager_app/view/add_task_view.dart';

import '../../util/constant.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddTaskView(),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: kBackgoundColor,
      child: const Icon(
        Icons.add,
        color: kPrimaryColor,
        size: 32,
      ),
    );
  }
}
