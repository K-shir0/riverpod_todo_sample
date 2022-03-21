import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class Todo extends Equatable {
  const Todo({
    this.id,
    this.title = '',
    this.memo = '',
    this.url = '',
  });

  @Id()
  final int? id;
  final String title;
  final String memo;
  final String url;

  @override
  List<Object?> get props => [title, memo, url];
}
