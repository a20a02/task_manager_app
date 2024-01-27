import 'package:flutter/material.dart';
import 'package:task_manager_app/controller/task_cubit/task_cubit.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/util/constant.dart';
import 'package:task_manager_app/view/widget/custom_appbar.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';
import 'package:task_manager_app/view/widget/custom_button.dart';

import 'widget/custom_task_text_form_field.dart';
import 'widget/custom_text_form_label.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desciption = TextEditingController();

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
                    'Add Task',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  const CustomTextFormFieldLabel(
                    label: 'Task Title',
                  ),
                  CustomTaskTextFormField(
                    controller: title,
                  ),
                  const SizedBox(height: 32),
                  const CustomTextFormFieldLabel(
                    label: 'Task Description',
                  ),
                  CustomTaskTextFormField(
                    controller: desciption,
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
                      text: 'Save',
                      onPress: () {
                        TaskCubit.get(context).addTask(
                          TaskModel(
                            name: title.text,
                            description: desciption.text,
                            time: DateTime.now().toString(),
                          ),
                        );
                        Navigator.of(context).pop();
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
}
