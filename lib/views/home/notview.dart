import 'package:flutter/material.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/widgets/note_item.dart';

class NoteView extends StatelessWidget {
  NoteView({
    super.key,
  });
  final List<NoteModel> notes = [
    NoteModel(
        color: Colors.red,
        title: 'test',
        descritpion: 'note',
        time: DateTime.now().toString())
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NoteItem(
          note: notes[index],
        ),
        itemCount: notes.length,
      ),
    );
  }
}
