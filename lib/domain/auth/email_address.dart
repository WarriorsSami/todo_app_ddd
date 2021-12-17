import 'package:todo_app_ddd/domain/core/value_objects.dart';
import 'package:todo_app_ddd/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String?> {
  @override
  final FailOrVal<String?> value;

  factory EmailAddress(String? input) {
    assert (input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}
