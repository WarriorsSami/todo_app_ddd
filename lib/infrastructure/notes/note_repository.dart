import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:todo_app_ddd/domain/notes/i_note_repository.dart';
import 'package:todo_app_ddd/domain/notes/note.dart';
import 'package:todo_app_ddd/domain/notes/note_failures.dart';
import 'package:todo_app_ddd/infrastructure/core/firestore_helpers.dart';
import 'package:todo_app_ddd/infrastructure/notes/note_dtos.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Stream<NoteFailureOr<KtList<Note>>> watchAll() async* {
    // users/{user ID}/notes/{note ID}
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map(
                  (doc) => NoteDTO.fromFirestore(doc).toDomain(),
                )
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<NoteFailureOr<KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) => NoteDTO.fromFirestore(doc).toDomain(),
          ),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where(
                  (note) =>
                      note.todos.getOrCrash().any((todoItem) => !todoItem.done),
                )
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Future<NoteFailureOr<Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).set(noteDTO.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<NoteFailureOr<Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).update(noteDTO.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<NoteFailureOr<Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();

      await userDoc.noteCollection.doc(noteId).delete();

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    }
  }
}
