import 'package:todo_app_ddd/domain/core/value_objects.dart';
import 'package:todo_app_ddd/domain/core/value_validators.dart';

class Password extends ValueObject<String?> {
  @override
  final FailOrVal<String?> value;

  factory Password(String? input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
