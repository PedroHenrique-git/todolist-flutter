import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/domain/task.dart';
import 'package:todolist/store/todo_store.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TodoStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create task'),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: inputController,
                      decoration: const InputDecoration(
                          labelText: 'Enter the task description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some valid description';
                        }

                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          store.addTask(Task(inputController.text, Finish.no));

                          Navigator.pop(context);
                        }
                      },
                      child: Text('Create',
                          style: TextStyle(color: Colors.grey[100])),
                    )
                  ]))),
    );
  }
}
