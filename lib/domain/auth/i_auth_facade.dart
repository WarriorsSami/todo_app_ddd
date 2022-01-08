import 'package:dartz/dartz.dart';
import 'package:todo_app_ddd/domain/auth/auth_failures.dart';
import 'package:todo_app_ddd/domain/auth/domain_user.dart';
import 'package:todo_app_ddd/domain/auth/email_address.dart';
import 'package:todo_app_ddd/domain/auth/password.dart';

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

  Future<Option<DomainUser>> getSignedInUser();

  Future<void> signOut();
}
