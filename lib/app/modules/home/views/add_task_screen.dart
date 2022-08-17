import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../task.dart';
import '../controllers/todo_controller.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  var descriptionEditingController = TextEditingController();
  var titleEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task Screen'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textField(
                    controller: titleEditingController, hint: 'title'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textField(
                    controller: descriptionEditingController,
                    hint: 'discription'),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () async {
                      Task task = Task(
                        title: titleEditingController.text,
                        description: descriptionEditingController.text,
                      );
                      await controller.addTask(task: task);
                      Get.back();
                    },
                    child: Text('Add Task'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TextField textField(
      {required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Color(0xFFE4E7EB),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
