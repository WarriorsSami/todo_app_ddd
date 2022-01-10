import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_ddd/application/auth/auth_bloc.dart';
import 'package:todo_app_ddd/injection.dart';
import 'package:todo_app_ddd/presentation/routes/app_router.gr.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.green[600]!,
            secondary: Colors.deepOrangeAccent,
            error: Colors.red,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
