import '../../model/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoadSuccess extends TaskState {
  final List<TaskModel> tasks;

  TaskLoadSuccess({required this.tasks});
}

class TaskLoadFailure extends TaskState {
  final String error;

  TaskLoadFailure({required this.error});
}
