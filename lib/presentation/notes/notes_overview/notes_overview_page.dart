import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_ddd/application/auth/auth_bloc.dart';
import 'package:todo_app_ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:todo_app_ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:todo_app_ddd/injection.dart';
import 'package:todo_app_ddd/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:todo_app_ddd/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:todo_app_ddd/presentation/routes/app_router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    AutoRouter.of(context).replace(const SignInPageRoute()),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.noteFailure.map(
                      unexpected: (_) =>
                          'Unexpected error occured while deleting, please contact support!',
                      unableToUpdate: (_) => 'Impossible error!',
                      insufficientPermissions: (_) =>
                          'Insufficient permissions!',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(const AuthEvent.signedOut());
              },
            ),
            actions: const <Widget>[
              UncompletedSwitch(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).push(
                NoteFormPageRoute(
                  editedNote: null,
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: const NotesOverviewBody(),
        ),
      ),
    );
  }
}
