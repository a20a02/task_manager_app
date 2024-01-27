import 'package:flutter/material.dart';

import '../../controller/task_cubit/task_cubit.dart';
import '../../util/constant.dart';
import '../edit_task_view.dart';

class CustomTaskContent extends StatelessWidget {
  const CustomTaskContent({
    super.key,
    required this.title,
    required this.description,
    required this.id,
  });

  final int id;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  TaskCubit.get(context).deleteTask(id);
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: kBackgoundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return EditTaskView(
                        taskIndex: id,
                      );
                    },
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: kBackgoundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
