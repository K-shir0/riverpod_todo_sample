import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/pages/todo_list_page/widgets/todo_edit_bottom_sheet/todo_edit_bottom_sheet.dart';
import 'package:riverpod_todo_sample/pages/todo_list_page/widgets/todo_list_tile.dart';
import 'package:riverpod_todo_sample/providers/todo_provider.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(TodoProviders.getTodosUseCaseProvider());

    return Scaffold(
      appBar: AppBar(title: const Text('TODO')),
      body: asyncValue.when(
        data: ((todos) {
          return ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, count) {
              final todo = todos[count];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TodoListTile(todo: todo),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Row(
                children: const [
                  // チェックボックス分のスペース
                  SizedBox(width: 48),
                  Expanded(child: Divider()),
                ],
              );
            },
          );
        }),
        error: (e, t) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => TodoEditBottomSheet().show(context),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
