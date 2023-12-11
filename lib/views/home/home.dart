import 'package:flutter/material.dart';

class HomeNote extends StatelessWidget {
  const HomeNote({super.key});
  static const String routeName = 'homeNote';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Today Tasks'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
      ),
    );
  }
}
