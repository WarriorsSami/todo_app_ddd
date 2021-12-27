
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_ddd/domain/auth/email_address.dart';
import 'package:todo_app_ddd/domain/auth/i_auth_facade.dart';
import 'package:todo_app_ddd/domain/auth/password.dart';
import 'package:todo_app_ddd/domain/auth/auth_failures.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      event.map(
          // delegate logic to email value object
          emailChanged: (e) {
            emit(state.copyWith(
              emailAddress: EmailAddress(e.emailStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          // delegate logic to password value object
          passwordChanged: (e) {
              emit(state.copyWith(
                password: Password(e.passwordStr),
                authFailureOrSuccessOption: none(),
              ));
          },

          /// emit a stream of events
          /// registerWithEmailAndPasswordPressed: (e) =>
          ///   emit.onEach(_performActionOnAuthFacadeWithEmailAndPasswordYielded(
          ///       _authFacade.registerWithEmailAndPassword,
          ///   ), onData: emit),
          /// signInWithEmailAndPasswordPressed: (e) =>
          ///   emit.onEach(_performActionOnAuthFacadeWithEmailAndPasswordYielded(
          ///       _authFacade.signInWithEmailAndPassword,
          ///   ), onData: emit),

          /// pass the emitter to the util function
          registerWithEmailAndPasswordPressed: (e) =>
              _performActionOnAuthFacadeWithEmailAndPassword(
                  _authFacade.registerWithEmailAndPassword,
                  emit
              ),
          signInWithEmailAndPasswordPressed: (e) =>
              _performActionOnAuthFacadeWithEmailAndPassword(
                  _authFacade.signInWithEmailAndPassword,
                  emit
              ),

          signInWithGooglePressed: (e) async {
            emit(state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ));

            final failureOrSuccess = await _authFacade.signInWithGoogle();
            emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess),
            ));
          },
      );
    });
  }

  // ignore: unused_element
  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPasswordYielded(
    Future<AFailOrVal> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    }) forwardedCall) async* {
    AFailOrVal? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<AFailOrVal> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    }) forwardedCall,
    Emitter<SignInFormState> emit) async {
    AFailOrVal? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
