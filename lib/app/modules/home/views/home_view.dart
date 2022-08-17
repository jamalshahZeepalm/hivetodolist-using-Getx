import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivetodolist/app/modules/home/controllers/todo_controller.dart';
import 'package:hivetodolist/app/modules/home/views/update_screen.dart';

import 'package:hivetodolist/app/modules/task.dart';

import '../controllers/home_controller.dart';
import 'add_task_screen.dart';

class HomeView extends GetView<HomeController> {
  TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    Task task = Task(title: 'title', description: 'description');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        builder: (context, Box<Task> tasks, _) {
          if (tasks.values.isEmpty) {
            return Center(
              child: Text('No Task Added Yet..!'),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Task task = tasks.getAt(index) as Task;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        onTap: () => Get.to(
                          () => UpdateScreen(task: task, index: index),
                        ),
                        onLongPress: () => remove(index: index),
                        title: Text(task.title),
                        subtitle: Text(task.description),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        valueListenable: todoController.todoBox.listenable(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTaskScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }

  Future<void> remove({required int index}) async {
    await todoController.deleteTask(index: index);
  }
}
