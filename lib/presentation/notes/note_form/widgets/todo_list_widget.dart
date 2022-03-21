import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_app_ddd/domain/notes/value_objects.dart';
import 'package:todo_app_ddd/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:todo_app_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer lists? Activate premium 🤩',
            button: TextButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: formTodos.value.size,
            itemBuilder: (context, index) {
              return TodoTile(
                index: index,
                key: ValueKey(
                  context.formTodos[index].id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.formTodos.getOrElse(
      index,
      (_) => TodoItemPrimitive.empty(),
    );
    final textEditingController = useTextEditingController(
      text: todo.name,
    );

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.15,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            flex: 2,
            label: 'Delete',
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            onPressed: (context) {
              context.formTodos = context.formTodos.minusElement(todo);
              BlocProvider.of<NoteFormBloc>(context).add(
                NoteFormEvent.todosChanged(todos: context.formTodos),
              );
            },
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) =>
                    listTodo == todo ? todo.copyWith(done: value!) : listTodo,
              );
              BlocProvider.of<NoteFormBloc>(context).add(
                NoteFormEvent.todosChanged(
                  todos: context.formTodos,
                ),
              );
            },
          ),
          title: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Todo',
              counterText: '',
              border: InputBorder.none,
            ),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) =>
                    listTodo == todo ? todo.copyWith(name: value) : listTodo,
              );
              BlocProvider.of<NoteFormBloc>(context).add(
                NoteFormEvent.todosChanged(
                  todos: context.formTodos,
                ),
              );
            },
            validator: (_) {
              return BlocProvider.of<NoteFormBloc>(context)
                  .state
                  .note
                  .todos
                  .value
                  .fold(
                    // Failure stemming from the TodoList length should NOT
                    // be displayed by the individual TextFormFields
                    (f) => null,
                    (todoList) => todoList[index].name.value.fold(
                          (f) => f.maybeMap(
                            empty: (_) => 'Cannot be empty',
                            exceedingLength: (_) => 'Too long',
                            multiline: (_) => 'Has to be in a single line',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
