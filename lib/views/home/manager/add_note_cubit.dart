import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notehive/constant/constant.dart';

import 'package:notehive/model/note_model.dart';
import 'package:notehive/views/home/manager/add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description, time = DateTime.now().toString();
  addNote() async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(hiveBox);

      await notesBox.add(NoteModel(
          color: Colors.blue.value,
          title: title!,
          descritpion: description!,
          time: time!));

      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteErrorState(errorMassage: e.toString()));
    }
  }

  void checkForm() {
    emit(FormNotVlidate());
    if (formKey.currentState!.validate()) {
      emit(FormVlidate());
      formKey.currentState!.save();
      log(title!);
      addNote();
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
