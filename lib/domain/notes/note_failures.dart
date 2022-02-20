import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_failures.freezed.dart';

typedef NoteFailureOr<T> = Either<NoteFailure, T>;

@freezed
class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = _Unexpected;
  const factory NoteFailure.insufficientPermissions() =
      _InsufficientPermissions;
  const factory NoteFailure.unableToUpdate() = _UnableToUpdate;
}
