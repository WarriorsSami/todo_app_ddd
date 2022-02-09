import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:todo_app_ddd/application/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            if (kDebugMode) {
              print('I am authenticated!');
            }
          },
          unauthenticated: (_) => Future.delayed(
            const Duration(seconds: 5),
            () => AutoRouter.of(context).replaceNamed('/sign-in-page'),
          ),
        );
      },
      child: const Scaffold(
        body: Center(
          child: RiveAnimation.asset(
            'assets/animations/movie_recorder_loading.riv',
          ),
        ),
      ),
    );
  }
}
