import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_todo_sample/models/task.dart';
import 'package:riverpod_todo_sample/providers/isar.dart';

class TaskRepository {
  TaskRepository(Reader read) {
    _isar = read(isarProvider).value!;
  }

  late final Isar _isar;

  Stream<List<Task>> getTasks() {
    return _isar.tasks.where().build().watch(initialReturn: true);
  }

  Future<Task?> saveTask(Task task) async {
    return _isar.writeTxn((conn) async {
      final tasks = _isar.tasks;

      final id = await tasks.put(task);

      return tasks.get(id);
    });
  }

  Future<bool> deleteTask(int id) async {
    return _isar.writeTxn((conn) async {
      final tasks = _isar.tasks;

      return await tasks.delete(id);
    });
  }
}
