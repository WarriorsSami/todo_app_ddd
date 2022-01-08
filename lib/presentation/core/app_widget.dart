import 'package:flutter/material.dart';
import 'package:todo_app_ddd/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const SignInPage(),
    );
  }
}
