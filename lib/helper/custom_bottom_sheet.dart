import 'package:flutter/material.dart';
import 'package:notehive/widgets/custom_button.dart';
import 'package:notehive/widgets/custom_textfiled.dart';

Future<dynamic> customBottomSheet(BuildContext context,
    {required TextEditingController titleController,
    required TextEditingController descriptionController}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8))),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          right: 8,
          left: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFiled(
                hintText: 'enter task title',
                type: 'title',
                inputType: TextInputType.name,
                controller: titleController),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
                hintText: 'enter task description',
                type: 'description',
                maxLines: 5,
                inputType: TextInputType.name,
                controller: descriptionController),
            const SizedBox(
              height: 30,
            ),
            CustomButton(type: 'Add Task', function: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
