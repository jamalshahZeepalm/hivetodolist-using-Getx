import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String? id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  Task({
    this.id,
    required this.title,
    required this.description,
  });
}
