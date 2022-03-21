import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/providers/isar.dart';

class TodoRepository {
  TodoRepository(Reader read) {
    _isar = read(isarProvider).value!;
  }

  late final Isar _isar;

  Stream<List<Todo>> getTodos() {
    return _isar.todos.where().build().watch(initialReturn: true);
  }

  Future<Todo?> saveTodo(Todo todo) async {
    return _isar.writeTxn((conn) async {
      final todos = _isar.todos;

      final id = await todos.put(todo);

      return todos.get(id);
    });
  }

  Future<bool> deleteTodo(int id) async {
    return _isar.writeTxn((conn) async {
      final todos = _isar.todos;

      return await todos.delete(id);
    });
  }
}
