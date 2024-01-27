import 'package:hive/hive.dart';
import 'package:task_manager_app/model/task_model.dart';

class TaskTypeAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      name: reader.readString(),
      description: reader.readString(),
      time: reader.readString(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeString(obj.time);
  }
}
