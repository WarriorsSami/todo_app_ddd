import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_ddd/injection.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
