import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager_app/controller/task_cubit/task_state.dart';
import 'package:task_manager_app/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  late Box<TaskModel> _taskBox;
  late List<TaskModel> tasks;

  static TaskCubit get(context) => BlocProvider.of(context);

  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<TaskModel>('tasks');
    _taskBox = Hive.box<TaskModel>('tasks');
  }

  Future<void> fetchTasks() async {
    await initHive();

    emit(TaskLoading());
    try {
      final tasks = _taskBox.values.toList();
      emit(TaskLoadSuccess(tasks: tasks));
    } catch (e) {
      log(e.toString());
      emit(TaskLoadFailure(error: e.toString()));
    }
  }

  Future<void> addTask(TaskModel task) async {
    emit(TaskLoading());
    try {
      await _taskBox.add(task);
      final tasks = _taskBox.values.toList();
      emit(TaskLoadSuccess(tasks: tasks));
    } catch (e) {
      emit(TaskLoadFailure(error: e.toString()));
    }
  }

  Future<void> editTask(int index, TaskModel updatedTask) async {
    emit(TaskLoading());
    try {
      await _taskBox.putAt(index, updatedTask);
      final tasks = _taskBox.values.toList();
      emit(TaskLoadSuccess(tasks: tasks));
    } catch (e) {
      emit(TaskLoadFailure(error: e.toString()));
    }
  }

  Future<void> deleteTask(int index) async {
    emit(TaskLoading());
    try {
      await _taskBox.deleteAt(index);
      final tasks = _taskBox.values.toList();
      emit(TaskLoadSuccess(tasks: tasks));
    } catch (e) {
      emit(TaskLoadFailure(error: e.toString()));
    }
  }
}
