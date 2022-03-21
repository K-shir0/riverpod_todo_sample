import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/task.dart';
import 'package:riverpod_todo_sample/pages/task_list_page/widgets/task_edit_bottom_sheet/task_edit_bottom_sheet.dart';
import 'package:riverpod_todo_sample/providers/task_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskListTile extends ConsumerWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => TaskEditBottomSheet().show(context, task: task),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: false,
            onChanged: (_) => ref.read(
              TaskProviders.deleteTaskUseCaseProvider()(task.id!),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                task.memo,
                style: Theme.of(context).textTheme.caption,
              ),
              if (task.url.isNotEmpty) ...[
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(task.url)) {
                      launch(task.url);
                    }
                  },
                  child: UrlBadge(url: task.url),
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
