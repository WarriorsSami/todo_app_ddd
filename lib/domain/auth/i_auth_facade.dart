import 'package:dartz/dartz.dart';
import 'package:todo_app_ddd/domain/auth/email_address.dart';
import 'package:todo_app_ddd/domain/auth/password.dart';
import 'package:todo_app_ddd/domain/auth/auth_failures.dart';

typedef AFailOrVal = Either<AuthFailure, Unit>;

abstract class IAuthFacade {
  Future<AFailOrVal> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<AFailOrVal> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<AFailOrVal> signInWithGoogle();
}