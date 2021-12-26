import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_ddd/domain/core/value_failures.dart';

typedef FailOrVal<T> = Either<ValueFailure<T>, T>;

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  FailOrVal<T> get value;

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ValueObject<T> &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}
