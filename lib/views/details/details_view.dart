import 'package:flutter/material.dart';
import 'package:notehive/widgets/custom_textfiled.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});
  static const String routeName = 'editTask';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomTextFiled(
              hintText: 'edit title',
              type: 'title',
              inputType: TextInputType.name,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextFiled(
              maxLines: 5,
              hintText: 'edit description',
              type: 'description',
              inputType: TextInputType.name,
            )
          ],
        ),
      ),
    );
  }
}
