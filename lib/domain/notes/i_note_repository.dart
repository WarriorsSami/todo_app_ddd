import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app_ddd/domain/notes/note.dart';
import 'package:todo_app_ddd/domain/notes/note_failures.dart';

abstract class INoteRepository {
  // watch notes
  Stream<NoteFailureOr<KtList<Note>>> watchAll();
  // watch uncompleted notes
  Stream<NoteFailureOr<KtList<Note>>> watchUncompleted();
  // CUD
  Future<NoteFailureOr<Unit>> create(Note note);
  Future<NoteFailureOr<Unit>> update(Note note);
  Future<NoteFailureOr<Unit>> delete(Note note);
}
