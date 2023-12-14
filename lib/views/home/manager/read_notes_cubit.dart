import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notehive/constant/constant.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/views/home/manager/read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? notes;
  void displayNotes() {
    var notesBox = Hive.box<NoteModel>(hiveBox);
    notes = notesBox.values.toList();
    emit(ReadNotesSuccessState());
  }
}
