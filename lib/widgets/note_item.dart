import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/router/routes.dart';
import 'package:notehive/views/home/manager/add_note_cubit.dart';
import 'package:notehive/views/home/manager/read_notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.editNote);
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 32, left: 24, right: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(note.color)),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        note.descritpion,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white.withOpacity(.7)),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(left: 20),
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<ReadNotesCubit>(context).displayNotes();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      note.time,
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
