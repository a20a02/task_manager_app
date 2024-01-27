import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/view/widget/custom_task_item.dart';

import '../../controller/task_cubit/task_cubit.dart';
import '../../controller/task_cubit/task_state.dart';
import '../../util/constant.dart';

class CustomTaskBuilder extends StatelessWidget {
  const CustomTaskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskLoadSuccess) {
          return state.tasks.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 128),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No Tasks Yet',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.tasks.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return CustomTaskItem(
                        id: index,
                        task: state.tasks[index],
                      );
                    },
                  ),
                );
        } else if (state is TaskLoading) {
          return const Expanded(
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        } else {
          return Text(
            'Failed when loading data ... Try Again',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          );
        }
      },
    );
  }
}
