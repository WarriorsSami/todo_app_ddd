import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_ddd/application/auth/sign_in_form/sign_in_form_bloc.dart';
// import 'package:todo_app_ddd/generated/assets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8),
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'assets/images/notebook.png',
                  width: 400,
                  height: 200,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.emailChanged(emailStr: value)),
                  validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.passwordChanged(passwordStr: value)),
                  validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                      .state
                      .password
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          shortPassword: (_) => 'Short Password',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(context).add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed(),
                          );
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(context).add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed(),
                          );
                        },
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SignInFormBloc>(context).add(
                      const SignInFormEvent.signInWithGooglePressed(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                  ),
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ]
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                title: 'Error',
                message: failure.map(
                  cancelledByUser: (_) => 'Sign in cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ),
                duration: const Duration(seconds: 5),
              ).show(context);
            },
            (_) {
              // TODO: navigate to home page
            },
          ),
        );
      },
    );
  }
}
