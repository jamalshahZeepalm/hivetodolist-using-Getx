 
import 'package:hive_flutter/adapters.dart';
import 'package:hivetodolist/app/modules/task.dart';


class DatabaseServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
  
    await Hive.openBox<Task>(HiveBoxes.todo);
     
  }

   


 }

class HiveBoxes {
  static String todo = 'todo_box';
  
}
