import 'package:flutter/material.dart';
import 'package:notehive/widgets/custom_button.dart';
import 'package:notehive/widgets/custom_textfiled.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});
 
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: EditNoteViewBody(),
        ),
      ),
    );
  }
}

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
  });

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomTextFiled(
            hintText: 'edit title',
            onSaved: (value) {
              title = value;
            },
            type: 'title',
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFiled(
            maxLines: 5,
            hintText: 'edit description',
            onSaved: (value) {
              description = value;
            },
            type: 'description',
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 100,
          ),
          CustomButton(
              type: 'Save',
              function: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              })
        ],
      ),
    );
  }
}
