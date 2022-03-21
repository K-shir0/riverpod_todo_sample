import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/repository/isar/todo.dart';

// repository
final _todoRepositoryProvider = Provider((ref) => TodoRepository(ref.read));

// use-cases
final _getTodosUseCaseProvider = StreamProvider.autoDispose(
  (ref) => ref.read(_todoRepositoryProvider).getTodos(),
);
final _saveTodoUseCaseProvider = Provider.autoDispose.family(
  (ref, Todo todo) => ref.read(_todoRepositoryProvider).saveTodo(todo),
);
final _deleteTodoUseCaseProvider = Provider.autoDispose.family(
  (ref, int id) => ref.read(_todoRepositoryProvider).deleteTodo(id),
);

class TodoProviders {
  const TodoProviders._();

  /// todoの一覧を提供するプロバイダ。
  static AutoDisposeStreamProvider<List<Todo>> getTodosUseCaseProvider() {
    return _getTodosUseCaseProvider;
  }

  /// todoの保存を提供するプロバイダ。
  ///
  /// id が指定してあれば更新。
  static AutoDisposeProviderFamily<Future<Todo?>, Todo>
      saveTodoUseCaseProvider() {
    return _saveTodoUseCaseProvider;
  }

  /// todoの削除を提供するプロバイダ。
  static AutoDisposeProviderFamily<Future<bool>, int>
      deleteTodoUseCaseProvider() {
    return _deleteTodoUseCaseProvider;
  }
}
