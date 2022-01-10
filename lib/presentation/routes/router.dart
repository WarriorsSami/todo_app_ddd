import 'package:auto_route/annotations.dart';
import 'package:todo_app_ddd/presentation/sign_in/sign_in_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SignInPage,
    ),
  ],
)
class $Router {}
