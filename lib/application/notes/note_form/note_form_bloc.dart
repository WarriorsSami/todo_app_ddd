import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app_ddd/domain/notes/i_note_repository.dart';
import 'package:todo_app_ddd/domain/notes/note.dart';
import 'package:todo_app_ddd/domain/notes/note_failures.dart';
import 'package:todo_app_ddd/domain/notes/value_objects.dart';
import 'package:todo_app_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            e.initialNoteOption.fold(
              () => state,
              (initialNote) => state.copyWith(
                note: initialNote,
                isEditing: true,
              ),
            ),
          );
        },
        bodyChanged: (e) async {
          emit(
            state.copyWith(
              note: state.note.copyWith(body: NoteBody(e.bodyStr)),
              saveFailureOrSuccessOption: none(),
            ),
          );
        },
        colorChanged: (e) async {
          emit(
            state.copyWith(
              note: state.note.copyWith(color: NoteColor(e.color)),
              saveFailureOrSuccessOption: none(),
            ),
          );
        },
        todosChanged: (e) async {
          // List3
          // TodoItem
          emit(
            state.copyWith(
              note: state.note.copyWith(
                todos: List3(
                  e.todos.map(
                    (primitive) => primitive.toDomain(),
                  ),
                ),
              ),
              saveFailureOrSuccessOption: none(),
            ),
          );
        },
        saved: (e) async {
          NoteFailureOr<Unit>? failureOrSuccess;

          emit(
            state.copyWith(
              isSaving: true,
              saveFailureOrSuccessOption: none(),
            ),
          );

          if (state.note.failureOption.isNone()) {
            failureOrSuccess = state.isEditing
                ? await _noteRepository.update(state.note)
                : await _noteRepository.create(state.note);
          }

          emit(
            state.copyWith(
              isSaving: false,
              showErrorMessages: true,
              saveFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
  }
}
