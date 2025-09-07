import 'package:flutter/material.dart';
import 'package:tugas_pm/main.dart'; // supaya bisa akses model Todo

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTask(String task) {
    if (task.isNotEmpty) {
      _todos.add(Todo(title: task));
      notifyListeners();
    }
  }

  void toggleTask(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
