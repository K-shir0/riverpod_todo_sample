import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/task.dart';
import 'package:riverpod_todo_sample/pages/task_list_page/widgets/task_edit_bottom_sheet/providers/task_form_state_provider.dart';
import 'package:riverpod_todo_sample/providers/task_provider.dart';

class TaskEditBottomSheet {
  show(BuildContext context, {Task? task}) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => _Body(task: task),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({
    Key? key,
    this.task,
  }) : super(key: key);

  final Task? task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  @override
  void initState() {
    super.initState();

    ref.read(taskFormStateProvider.notifier).init(task: widget.task);
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = ref.read(taskFormStateProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              // Consumer で限定的にしないとテキスト編集でリビルドされてしまう
              Consumer(builder: (BuildContext _, WidgetRef ref, Widget? __) {
                final isInputted = ref.watch(taskFormStateProvider);

                return TextButton(
                  onPressed: isInputted
                      ? () async {
                          final task = await ref
                              .read(TaskProviders.saveTaskUseCaseProvider()(
                            Task(
                              id: widget.task?.id,
                              title: formProvider.titleController.text,
                              memo: formProvider.memoController.text,
                              url: formProvider.urlController.text,
                            ),
                          ));

                          if (task != null) {
                            Navigator.pop(context);
                          }
                        }
                      : null,
                  child: const Text('完了'),
                );
              })
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
            child: Column(
              children: [
                TextField(
                  controller: formProvider.titleController,
                  decoration: const InputDecoration(hintText: 'タイトル'),
                ),
                TextField(
                  controller: formProvider.memoController,
                  decoration: const InputDecoration(hintText: 'メモ'),
                ),
                TextField(
                  controller: formProvider.urlController,
                  decoration: const InputDecoration(hintText: 'URL'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
