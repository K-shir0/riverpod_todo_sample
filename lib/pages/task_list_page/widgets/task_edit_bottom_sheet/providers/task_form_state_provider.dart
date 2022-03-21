import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/task.dart';

final taskFormStateProvider =
    StateNotifierProvider.autoDispose<TaskFormStateNotifier, bool>(
        (ref) => TaskFormStateNotifier());

class TaskFormStateNotifier extends StateNotifier<bool> {
  TaskFormStateNotifier() : super(false);

  late TextEditingController titleController = TextEditingController();
  late TextEditingController memoController = TextEditingController();
  late TextEditingController urlController = TextEditingController();
  bool isInitialized = false;

  @override
  void dispose() {
    _controllerDispose();
    super.dispose();
  }

  void init({Task? task}) {
    // 既に初期化してあった場合に破棄
    if (isInitialized) {
      _controllerDispose();
    }
    isInitialized = true;

    titleController = TextEditingController(text: task?.title);
    memoController = TextEditingController(text: task?.memo);
    urlController = TextEditingController(text: task?.url);
    titleController.addListener(_onChange);

    // 初回に呼び出さないと編集時に評価されない
    _onChange();
  }

  void _controllerDispose() {
    titleController.dispose();
    memoController.dispose();
    urlController.dispose();
  }

  void _onChange() {
    state = titleController.text.isNotEmpty;
  }
}
