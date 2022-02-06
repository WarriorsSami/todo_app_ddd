import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_ddd/domain/core/value_objects.dart';

part 'domain_user.freezed.dart';

@freezed
class DomainUser with _$DomainUser {
  const factory DomainUser({
    required UniqueId id,
  }) = _DomainUser;
}
