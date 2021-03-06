import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_ddd/domain/core/errors.dart';
import 'package:todo_app_ddd/domain/core/value_failures.dart';
import 'package:uuid/uuid.dart';

typedef FailOrVal<T> = Either<ValueFailure<T>, T>;

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  FailOrVal<T> get value;

  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() => value.fold(
        (f) => throw UnexpectedValueError(f),
        // id = identity or the same as (right) => right
        id,
      );

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

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

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(
        const Uuid().v1(),
      ),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(
        uniqueId,
      ),
    );
  }

  const UniqueId._(this.value);
}
