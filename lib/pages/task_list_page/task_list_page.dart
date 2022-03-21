import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/pages/task_list_page/widgets/task_edit_bottom_sheet/task_edit_bottom_sheet.dart';
import 'package:riverpod_todo_sample/pages/task_list_page/widgets/task_list_tile.dart';
import 'package:riverpod_todo_sample/providers/task_provider.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(TaskProviders.getTasksUseCaseProvider());

    return Scaffold(
      appBar: AppBar(title: const Text('TODO')),
      body: asyncValue.when(
        data: ((tasks) {
          return ListView.separated(
            itemCount: tasks.length,
            itemBuilder: (context, count) {
              final task = tasks[count];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TaskListTile(task: task),
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
        onPressed: () => TaskEditBottomSheet().show(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
