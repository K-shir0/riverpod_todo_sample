import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_todo_sample/models/todo.dart';

final isarProvider = FutureProvider(
  (ref) async {
    final dir = await getApplicationSupportDirectory();

    return Isar.open(
      schemas: [TodoSchema],
      directory: dir.path,
    );
  },
);
