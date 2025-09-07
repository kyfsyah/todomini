import 'package:flutter/material.dart';
import '../main.dart'; // supaya bisa akses model Todo

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo?;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Todo")),
      body: Center(
        child: todo == null
            ? const Text("Tidak ada data")
            : Text(
                "Judul: ${todo.title}\nStatus: ${todo.isDone ? 'Selesai' : 'Belum'}",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
