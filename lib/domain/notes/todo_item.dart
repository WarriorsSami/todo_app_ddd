import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_ddd/domain/core/value_failures.dart';
import 'package:todo_app_ddd/domain/core/value_objects.dart';
import 'package:todo_app_ddd/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  const TodoItem._();

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
