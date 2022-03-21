import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/pages/todo_list_page/widgets/todo_edit_bottom_sheet/providers/todo_form_state_provider.dart';
import 'package:riverpod_todo_sample/providers/todo_provider.dart';

class TodoEditBottomSheet {
  show(BuildContext context, {Todo? todo}) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => _Body(todo: todo),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({
    Key? key,
    this.todo,
  }) : super(key: key);

  final Todo? todo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  @override
  void initState() {
    super.initState();

    ref.read(todoFormStateProvider.notifier).init(todo: widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = ref.read(todoFormStateProvider.notifier);

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
                final isInputted = ref.watch(todoFormStateProvider);

                return TextButton(
                  onPressed: isInputted
                      ? () async {
                          final todo = await ref
                              .read(TodoProviders.saveTodoUseCaseProvider()(
                            Todo(
                              id: widget.todo?.id,
                              title: formProvider.titleController.text,
                              memo: formProvider.memoController.text,
                              url: formProvider.urlController.text,
                            ),
                          ));

                          if (todo != null) {
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
