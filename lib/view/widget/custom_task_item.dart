import 'package:flutter/material.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/view/details_task_view.dart';
import 'package:task_manager_app/view/widget/custom_task_content.dart';
import 'package:task_manager_app/view/widget/custom_task_time.dart';

import '../../util/constant.dart';

class CustomTaskItem extends StatelessWidget {
  const CustomTaskItem({
    super.key,
    required this.task,
    required this.id,
  });

  final TaskModel task;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailsTaskView(
              task: task,
            );
          },
        ));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.22,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: CustomTaskContent(
                id: id,
                title: task.name,
                description: task.description,
              ),
            ),
            const Expanded(
              child: CustomTaskTime(),
            ),
          ],
        ),
      ),
    );
  }
}
