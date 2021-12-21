import 'dart:async';

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
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
