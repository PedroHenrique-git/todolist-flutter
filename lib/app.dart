import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/config.dart';
import 'package:todolist/domain/task.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/store/todo_store.dart';

class App extends StatelessWidget {
  final List<Task> persistedTasks;

  const App({super.key, required this.persistedTasks});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoStore(tasks: persistedTasks),
        child: MaterialApp(
          title: Config.appName,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[100],
                iconTheme: IconThemeData(color: Colors.grey[900]),
                titleTextStyle:
                    TextStyle(color: Colors.grey[900], fontSize: 18)),
            textTheme: TextTheme(
                // LABEL
                labelSmall: TextStyle(color: Colors.grey[900], fontSize: 12),
                labelMedium: TextStyle(color: Colors.grey[900], fontSize: 16),
                labelLarge: TextStyle(color: Colors.grey[900], fontSize: 20),

                //BODY
                bodySmall: TextStyle(color: Colors.grey[900], fontSize: 12),
                bodyMedium: TextStyle(color: Colors.grey[900], fontSize: 16),
                bodyLarge: TextStyle(color: Colors.grey[900], fontSize: 20),

                // HEADLINE
                headlineSmall: TextStyle(color: Colors.grey[900], fontSize: 12),
                headlineMedium:
                    TextStyle(color: Colors.grey[900], fontSize: 16),
                headlineLarge: TextStyle(color: Colors.grey[900], fontSize: 20),

                // DISPLAY
                displaySmall: TextStyle(color: Colors.grey[900], fontSize: 12),
                displayMedium: TextStyle(color: Colors.grey[900], fontSize: 16),
                displayLarge: TextStyle(color: Colors.grey[900], fontSize: 20),

                // TITLE
                titleSmall: TextStyle(color: Colors.grey[900], fontSize: 12),
                titleMedium: TextStyle(color: Colors.grey[900], fontSize: 16),
                titleLarge: TextStyle(color: Colors.grey[900], fontSize: 20)),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
          ),
          home: const Home(),
        ));
  }
}
