import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_ddd/application/notes/note_watcher/note_watcher_bloc.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return ListView.builder(
              itemCount: state.notes.size,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return Container(
                  color:
                      note.failureOption.isSome() ? Colors.red : Colors.green,
                  width: 100,
                  height: 100,
                );
              },
            );
          },
          loadFailure: (state) {
            return Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            );
          },
        );
      },
    );
  }
}
