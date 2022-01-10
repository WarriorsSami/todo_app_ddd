import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_ddd/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: (e) async {
            final userOption = await _authFacade.getSignedInUser();
            emit(
              userOption.fold(
                () => const AuthState.unauthenticated(),
                (_) => const AuthState.authenticated(),
              ),
            );
          },
          signedOut: (e) async {
            await _authFacade.signOut();
            emit(const AuthState.unauthenticated());
          },
        );
      },
    );
  }
}
