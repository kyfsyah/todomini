import 'package:flutter/material.dart';
import 'detailscreen.dart'; // import halaman detail

void main() {
  runApp(const TodoApp());
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

// HOME SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Judul tidak boleh kosong")),
      );
      return;
    }
    setState(() {
      _todos.add(Todo(title: text));
      _controller.clear();
    });
  }

  void _toggleDone(int index, bool? value) {
    setState(() {
      _todos[index].isDone = value ?? false;
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _goToDetail(Todo todo) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: todo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo Mini")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Tambah todo",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _todos.isEmpty
                  ? const Center(child: Text("Belum ada todo"))
                  : ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todo = _todos[index];
                        return ListTile(
                          leading: Checkbox(
                            value: todo.isDone,
                            onChanged: (val) => _toggleDone(index, val),
                          ),
                          title: GestureDetector(
                            onTap: () => _goToDetail(todo),
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
                            onPressed: () => _deleteTodo(index),
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
