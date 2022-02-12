import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:kt_dart/kt.dart';
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

FailOrVal<String> validateMaxStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

FailOrVal<String> validateStringNonEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      ValueFailure.empty(failedValue: input),
    );
  }
}

FailOrVal<String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(
      ValueFailure.multiline(failedValue: input),
    );
  } else {
    return right(input);
  }
}

FailOrVal<KtList<T>> validateMaxListLength<T>(KtList<T> input, int maxLength) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.listTooLong(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}
