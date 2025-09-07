import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pm/screen/DetailScreen.dart';
import 'package:tugas_pm/screen/HomeScreen.dart';
import 'screen/HomeScreen.dart';
import 'screen/DetailScreen.dart';
import 'models/providers/todo_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const TodoApp(),
    ),
  );
}

// MODEL DATA
class Todo {
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false});
}

// ROOT APP
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo Mini App",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

