part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    // for showing the progress bar
    required bool isSubmitting,
    // for fetching the back-end's response
    required Option<AFailOrVal> authFailureOrSuccessOption,
    // for enabling auto-validation for the input fields
    // and showing the error messages
    required bool showErrorMessages,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
    emailAddress: EmailAddress(''),
    password: Password(''),
    isSubmitting: false,
    authFailureOrSuccessOption: none(),
    showErrorMessages: false,
  );
}
