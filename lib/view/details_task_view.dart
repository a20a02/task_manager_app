import 'package:flutter/material.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/view/widget/custom_appbar.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';

class DetailsTaskView extends StatelessWidget {
  const DetailsTaskView({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundWidget(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onPress: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.arrow_forward,
                text: '',
              ),
              Text(
                'Task Title',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                task.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Task Decsiption',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                task.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
