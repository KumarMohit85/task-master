import 'package:task_master/features/tasks/domain/entities/task.dart';

class TaskModel extends Tasks {
  const TaskModel(
      {required String id,
      required String title,
      required String description,
      required bool isCompleted,
      required DateTime createdAt})
      : super(
            id: id,
            title: title,
            description: description,
            isCompleted: isCompleted,
            createdAt: createdAt);

  factory TaskModel.fromJSON(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'],
        createdAt: DateTime.parse(json['createdAt'] as String));
  }

  Map<String, dynamic> toJSON() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'isCompleted': isCompleted
      };

  TaskModel copyWith(
      {String? id,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? createdAt}) {
    return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt);
  }
}
