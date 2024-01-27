import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';
import 'package:task_manager_app/view/widget/custom_task_text_form_field.dart';
import 'package:task_manager_app/view/widget/custom_text_form_label.dart';

import '../controller/task_cubit/task_cubit.dart';
import '../model/task_model.dart';
import '../util/constant.dart';
import 'widget/custom_appbar.dart';
import 'widget/custom_button.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.taskIndex});
  final int taskIndex;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _decriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.arrow_forward,
                    text: 'Welcome',
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Edit Task',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  const CustomTextFormFieldLabel(
                    label: 'Task Title',
                  ),
                  CustomTaskTextFormField(
                    controller: _titleController,
                  ),
                  const SizedBox(height: 32),
                  const CustomTextFormFieldLabel(
                    label: 'Task Description',
                  ),
                  CustomTaskTextFormField(
                    controller: _decriptionController,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextFormFieldLabel(
                            label: 'Task Hour',
                          ),
                          Container(
                            width: 150,
                            height: 38,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextFormFieldLabel(
                            label: 'Task Day',
                          ),
                          Container(
                            width: 150,
                            height: 38,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      minWidth: 220,
                      text: 'Edit',
                      onPress: () {
                        _editTask();
                      },
                      height: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editTask() {
    String updatedTaskTitle = _titleController.text.trim();
    String updatedTaskDescription = _decriptionController.text.trim();
    if (updatedTaskTitle.isNotEmpty && updatedTaskDescription.isNotEmpty) {
      TaskModel updatedTask = TaskModel(
        name: updatedTaskTitle,
        description: updatedTaskDescription,
        time: DateTime.now().toString(),
      );
      TaskCubit.get(context).editTask(widget.taskIndex, updatedTask);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid task title'),
        ),
      );
    }
  }
}
