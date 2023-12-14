import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/views/home/manager/read_notes_cubit.dart';
import 'package:notehive/widgets/note_item.dart';

import 'manager/read_notes_state.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        var notes = BlocProvider.of<ReadNotesCubit>(context).notes ?? [];

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
      },
    );
  }
}
