import 'package:flutter/material.dart';
import 'package:notehive/helper/custom_bottom_sheet.dart';
import 'package:notehive/views/home/notview.dart';

class HomeNote extends StatelessWidget {
  HomeNote({super.key});
  static const String routeName = 'homeNote';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today Tasks'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customBottomSheet(context,
              titleController: titleController,
              descriptionController: descriptionController);
        },
        child: const Icon(Icons.add),
      ),
      body:  NoteView(),
    );
  }
}
