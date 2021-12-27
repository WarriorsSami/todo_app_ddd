import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

typedef AFailOrVal = Either<AuthFailure, Unit>;

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
