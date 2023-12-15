import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/views/home/manager/read_notes_cubit.dart';
import 'package:notehive/widgets/custom_textfiled.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.descritpion = description ?? widget.note.descritpion;
              widget.note.save().then((value) {
                BlocProvider.of<ReadNotesCubit>(context).displayNotes();
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
        
            ],
          ),
        ),
      ),
    );
  }
}
