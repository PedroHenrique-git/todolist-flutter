import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/domain/task.dart';
import 'package:todolist/store/todo_store.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TodoStore>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
      child: store.tasksTodo().isEmpty ? const EmptyState() : const List(),
    );
  }
}

class List extends StatelessWidget {
  const List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TodoStore>();

    return Center(
      child: SizedBox(
        height: 700,
        child: ListView(
          children: [
            for (var task in store.tasksTodo())
              Card(
                child: ListTile(
                  leading: Icon(task.finish == Finish.yes
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  title: Text(task.description),
                  onTap: () => {store.toggleStatus(task.id)},
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Congratulations!\n you dont have tasks to do!',
          textAlign: TextAlign.center),
    );
  }
}
