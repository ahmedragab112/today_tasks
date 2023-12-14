import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notehive/constant/constant.dart';
import 'package:notehive/manager/add_note_cubit/cubit/add_note_state.dart';
import 'package:notehive/model/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Future<void> addNote(NoteModel note) async {
    emit(AddNoteLoadingState());

    try {
      var notesBox = Hive.box<NoteModel>(hiveBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } on HiveError catch (e) {
      emit(AddNoteErrorState(errorMassage: e.message));
    } catch (e) {
      emit(AddNoteErrorState(errorMassage: e.toString()));
    }
  }
}
