
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_ddd/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
