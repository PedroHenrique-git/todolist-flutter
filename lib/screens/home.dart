import 'package:flutter/material.dart';
import 'package:todolist/config.dart';
import 'package:todolist/screens/create_task.dart';
import 'package:todolist/widgets/tasks-list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Config.appName)),
      body: const TasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTask()),
          );
        },
        backgroundColor: Colors.grey[100],
        child: Icon(Icons.add, color: Colors.grey[900]),
      ),
    );
  }
}
