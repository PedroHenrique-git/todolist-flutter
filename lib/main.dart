import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/app.dart';
import 'package:todolist/domain/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var prefs = await SharedPreferences.getInstance();

  List<dynamic> tasksJson = jsonDecode(prefs.getString('tasks') ?? '[]');

  List<Task> tasks = [];

  for (var jsonTask in tasksJson) {
    Task task = Task.fromJson(jsonTask);
    tasks.add(task);
  }

  runApp(App(
    persistedTasks: tasks,
  ));
}
