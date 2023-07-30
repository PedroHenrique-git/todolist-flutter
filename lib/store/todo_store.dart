import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/domain/task.dart';

class TodoStore extends ChangeNotifier {
  List<Task> tasks = [];

  TodoStore({required this.tasks});

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<void> persistTasks() async {
    var prefs = await getPrefs();

    await prefs.setString('tasks', jsonEncode(tasks));
  }

  Future<void> addTask(Task task) async {
    tasks.add(task);

    await persistTasks();

    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    tasks.remove(task);

    await persistTasks();

    notifyListeners();
  }

  Future<void> toggleStatus(String id) async {
    int index = tasks.indexWhere((element) => element.id == id);

    if (index == -1) {
      return;
    }

    Task newTask = tasks[index];
    newTask.finish = newTask.finish == Finish.yes ? Finish.no : Finish.yes;

    tasks[index] = newTask;

    await persistTasks();

    notifyListeners();
  }

  List<Task> tasksTodo() {
    return tasks.where((element) => element.finish == Finish.no).toList();
  }

  bool exists(Task task) {
    return tasks.contains(task);
  }
}
