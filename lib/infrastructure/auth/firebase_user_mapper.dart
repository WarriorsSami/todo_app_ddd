import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_ddd/domain/auth/domain_user.dart';
import 'package:todo_app_ddd/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  DomainUser toDomainUser() {
    return DomainUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
