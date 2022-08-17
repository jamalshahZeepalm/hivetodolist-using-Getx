import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivetodolist/app/modules/home/controllers/todo_controller.dart';

import '../../task.dart';

class UpdateScreen extends StatefulWidget {
  final Task task;
  final int index;
  UpdateScreen({super.key, required this.task, required this.index});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
  TodoController todoController = Get.find<TodoController>();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController descriptionEditingController = TextEditingController();

  TextEditingController titleEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleEditingController.text = widget.task.title;
    descriptionEditingController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task Screen'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  textField(controller: titleEditingController, hint: 'title'),
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
                    await widget.todoController
                        .updateTask(task: task, index: widget.index);
                    Get.back();
                  },
                  child: Text('update Task'),
                ),
              ),
            ),
          ],
        ),
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
