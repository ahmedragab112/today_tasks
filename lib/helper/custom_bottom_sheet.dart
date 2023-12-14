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
      child: const SingleChildScrollView(
        child: AddNoteView(),
      ),
    ),
  );
}

class AddNoteView extends StatefulWidget {
  const AddNoteView({
    super.key,
  });

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            hintText: 'enter task title',
            type: 'title',
            onSaved: (value) {
              title = value;
            },
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            hintText: 'enter task description',
            type: 'description',
            onSaved: (value) {
              description = value;
            },
            maxLines: 5,
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
              type: 'Add Task',
              function: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
