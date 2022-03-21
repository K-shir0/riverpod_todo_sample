import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/task.dart';
import 'package:riverpod_todo_sample/repository/isar/task.dart';

// repository
final _taskRepositoryProvider = Provider((ref) => TaskRepository(ref.read));

// use-cases
final _getTasksUseCaseProvider = StreamProvider.autoDispose(
  (ref) => ref.read(_taskRepositoryProvider).getTasks(),
);
final _saveTaskUseCaseProvider = Provider.autoDispose.family(
  (ref, Task task) => ref.read(_taskRepositoryProvider).saveTask(task),
);
final _deleteTaskUseCaseProvider = Provider.autoDispose.family(
  (ref, int id) => ref.read(_taskRepositoryProvider).deleteTask(id),
);

class TaskProviders {
  const TaskProviders._();

  /// taskの一覧を提供するプロバイダ。
  static AutoDisposeStreamProvider<List<Task>> getTasksUseCaseProvider() {
    return _getTasksUseCaseProvider;
  }

  /// taskの保存を提供するプロバイダ。
  ///
  /// id が指定してあれば更新。
  static AutoDisposeProviderFamily<Future<Task?>, Task>
      saveTaskUseCaseProvider() {
    return _saveTaskUseCaseProvider;
  }

  /// taskの削除を提供するプロバイダ。
  static AutoDisposeProviderFamily<Future<bool>, int>
      deleteTaskUseCaseProvider() {
    return _deleteTaskUseCaseProvider;
  }
}
