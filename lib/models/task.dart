import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'task.g.dart';

@Collection()
class Task extends Equatable {
  const Task({
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
