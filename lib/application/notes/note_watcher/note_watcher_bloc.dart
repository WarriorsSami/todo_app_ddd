import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app_ddd/domain/notes/i_note_repository.dart';
import 'package:todo_app_ddd/domain/notes/note.dart';
import 'package:todo_app_ddd/domain/notes/note_failures.dart';

part 'note_watcher_bloc.freezed.dart';
part 'note_watcher_event.dart';
part 'note_watcher_state.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;

  StreamSubscription<NoteFailureOr<KtList<Note>>>? _noteStreamSubscription;

  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>((event, emit) async {
      await event.map(
        watchAllStarted: (e) async {
          emit(const NoteWatcherState.loadInProgress());
          await _noteStreamSubscription?.cancel();
          _noteStreamSubscription = _noteRepository.watchAll().listen(
                (failureOrNotes) => add(
                  NoteWatcherEvent.notesReceived(failureOrNotes),
                ),
              );
        },
        watchUncompletedStarted: (e) async {
          emit(const NoteWatcherState.loadInProgress());
          await _noteStreamSubscription?.cancel();
          _noteStreamSubscription = _noteRepository.watchUncompleted().listen(
                (failureOrNotes) => add(
                  NoteWatcherEvent.notesReceived(failureOrNotes),
                ),
              );
        },
        notesReceived: (e) async {
          emit(
            e.failureOrNotes.fold(
              (f) => NoteWatcherState.loadFailure(f),
              (notes) => NoteWatcherState.loadSuccess(notes),
            ),
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _noteStreamSubscription?.cancel();
    return super.close();
  }
}
