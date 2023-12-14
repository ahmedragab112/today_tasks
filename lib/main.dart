import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notehive/constant/constant.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/theme/apptheme.dart';
import 'package:notehive/views/edit_task/edit_task_view.dart';
import 'package:notehive/views/home/home.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(hiveBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeNote.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeNote.routeName: (context) => const HomeNote(),
        EditTaskView.routeName: (context) => const EditTaskView()
      },
    );
  }
}
