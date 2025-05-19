import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_master/core/failures/failures.dart';
import 'package:task_master/features/tasks/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  // gives list of all cached tasks
  Future<List<TaskModel>> getCachedTasks();
  // caches the tasks locally
  Future<void> cacheTasks(List<TaskModel> tasks);
}

const String _cachedTasksKey = 'CACHED_TASKS';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;
  TaskLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheTasks(List<TaskModel> tasks) async {
    final List<String> taskJsonList =
        tasks.map((task) => json.encode(task.toJSON())).toList();

    final success =
        await sharedPreferences.setStringList(_cachedTasksKey, taskJsonList);

    if (!success) {
      throw CacheFailure('Failed to cache tasks');
    }
  }

  @override
  Future<List<TaskModel>> getCachedTasks() async {
    final List<String>? taskJsonList =
        sharedPreferences.getStringList(_cachedTasksKey);

    if (taskJsonList != null) {
      try {
        return taskJsonList
            .map((jsonStr) => TaskModel.fromJSON(
                json.decode(jsonStr) as Map<String, dynamic>))
            .toList();
      } catch (e) {
        throw CacheFailure('Error while parsing cached tasks');
      }
    } else {
      throw CacheFailure('No cached tasks found');
    }
  }
}
