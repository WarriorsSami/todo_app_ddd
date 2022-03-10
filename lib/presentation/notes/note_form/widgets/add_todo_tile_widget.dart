import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_app_ddd/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:todo_app_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (f) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            (todoItem) => TodoItemPrimitive.fromDomain(
              todoItem,
            ),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add a todo'),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos = context.formTodos.plusElement(
              TodoItemPrimitive.empty(),
            );

            BlocProvider.of<NoteFormBloc>(context).add(
              NoteFormEvent.todosChanged(
                todos: context.formTodos,
              ),
            );
          },
        );
      },
    );
  }
}
