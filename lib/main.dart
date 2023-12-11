import 'package:flutter/material.dart';
import 'package:notehive/theme/apptheme.dart';
import 'package:notehive/views/home/home.dart';

void main() {
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
      routes: {HomeNote.routeName: (context) => const HomeNote()},
    );
  }
}
