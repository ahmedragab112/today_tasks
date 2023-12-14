import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/views/home/add_note_form.dart';
import 'package:notehive/views/home/manager/add_note_cubit.dart';
import 'package:notehive/views/home/manager/add_note_state.dart';
import 'package:notehive/views/home/manager/read_notes_cubit.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMassage)));
        } else if (state is AddNoteSuccessState) {
          BlocProvider.of<ReadNotesCubit>(context).displayNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                right: 8,
                left: 8),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
