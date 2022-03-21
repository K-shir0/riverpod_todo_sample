import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';

final todoFormStateProvider =
    StateNotifierProvider.autoDispose<TodoFormStateNotifier, bool>(
        (ref) => TodoFormStateNotifier());

class TodoFormStateNotifier extends StateNotifier<bool> {
  TodoFormStateNotifier() : super(false);

  late TextEditingController titleController = TextEditingController();
  late TextEditingController memoController = TextEditingController();
  late TextEditingController urlController = TextEditingController();
  bool isInitialized = false;

  @override
  void dispose() {
    _controllerDispose();
    super.dispose();
  }

  void init({Todo? todo}) {
    // 既に初期化してあった場合に破棄
    if (isInitialized) {
      _controllerDispose();
    }
    isInitialized = true;

    titleController = TextEditingController(text: todo?.title);
    memoController = TextEditingController(text: todo?.memo);
    urlController = TextEditingController(text: todo?.url);
    titleController.addListener(() {
      state = titleController.text.isNotEmpty;
    });
  }

  void _controllerDispose() {
    titleController.dispose();
    memoController.dispose();
    urlController.dispose();
  }
}
