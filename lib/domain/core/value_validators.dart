import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app_ddd/domain/core/value_failures.dart';
import 'package:todo_app_ddd/domain/core/value_objects.dart';

FailOrVal<String> validateEmailAddress(String input) {
  if (EmailValidator.validate(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

FailOrVal<String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}
