

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hivetodolist/app/modules/task.dart';
import 'package:hivetodolist/services/database.dart';

class TodoController extends GetxController {
  var todoBox = Hive.box<Task>(HiveBoxes.todo);

  Future<void> addTask({required Task task}) async {
    await todoBox.add(task);
  }

  Future<void> updateTask({required Task task, required int index}) async {
    await todoBox.putAt(index, task);
    
  }

  Future<void> deleteTask({required int index}) async {
   await todoBox.deleteAt(index);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
