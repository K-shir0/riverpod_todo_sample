import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/pages/todo_list_page/todo_list_page.dart';
import 'package:riverpod_todo_sample/providers/isar.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);

    return isar.when(
      data: (_) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TodoListPage(),
      ),
      error: (e, s) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
