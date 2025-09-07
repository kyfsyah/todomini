import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providers/todo_provider.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final controller = TextEditingController();

    void addTodo() {
      final text = controller.text.trim();
      if (text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Judul tidak boleh kosong")),
        );
        return;
      }
      todoProvider.addTask(text);
      controller.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Todo Mini - Home")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Tambah todo",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTodo,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: todoProvider.todos.isEmpty
                  ? const Center(child: Text("Belum ada todo"))
                  : ListView.builder(
                      itemCount: todoProvider.todos.length,
                      itemBuilder: (context, index) {
                        final todo = todoProvider.todos[index];
                        return ListTile(
                          leading: Checkbox(
                            value: todo.isDone,
                            onChanged: (_) => todoProvider.toggleTask(index),
                          ),
                          title: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: todo,
                              );
                            },
                            child: Text(
                              todo.title,
                              style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => todoProvider.removeTask(index),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
