import 'package:flutter/material.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/widgets/custom_button.dart';

import '../../widgets/custom_textfiled.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomTextFiled(
          hintText: 'edit title',
          type: 'title',
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextFiled(
          maxLines: 5,
          hintText: 'edit description',
          type: 'description',
          onChanged: (value) {
            description = value;
          },
        ),
        const SizedBox(
          height: 100,
        ),
        CustomButton(type: 'Save', function: () {
          
        })
      ],
    );
  }
}
