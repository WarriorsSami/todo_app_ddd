import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc() : super(NoteActorInitial()) {
    on<NoteActorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
