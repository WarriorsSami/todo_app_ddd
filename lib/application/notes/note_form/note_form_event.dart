part of 'note_form_bloc.dart';

@freezed
class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized({
    required Option<Note> initialNoteOption,
  }) = _Initialized;

  const factory NoteFormEvent.bodyChanged({
    required String bodyStr,
  }) = _BodyChanged;
  const factory NoteFormEvent.colorChanged({
    required Color color,
  }) = _ColorChanged;
  const factory NoteFormEvent.todosChanged({
    required KtList<TodoItemPrimitive> todos,
  }) = _TodosChanged;

  const factory NoteFormEvent.saved() = _Saved;
}
