import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/pages/todo_list_page/widgets/todo_edit_bottom_sheet/todo_edit_bottom_sheet.dart';
import 'package:riverpod_todo_sample/providers/todo_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TodoListTile extends ConsumerWidget {
  const TodoListTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => TodoEditBottomSheet().show(context, todo: todo),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: false,
            onChanged: (_) => ref.read(
              TodoProviders.deleteTodoUseCaseProvider()(todo.id!),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                todo.memo,
                style: Theme.of(context).textTheme.caption,
              ),
              if (todo.url.isNotEmpty) ...[
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(todo.url)) {
                      launch(todo.url);
                    }
                  },
                  child: UrlBadge(url: todo.url),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}

class UrlBadge extends StatelessWidget {
  const UrlBadge({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.link),
            const SizedBox(width: 4),
            Text(uri.host.isEmpty ? url : uri.host),
          ],
        ),
      ),
    );
  }
}
