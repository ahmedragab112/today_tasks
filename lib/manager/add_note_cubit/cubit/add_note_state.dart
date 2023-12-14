class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteErrorState extends AddNoteState {
  final String errorMassage;

  AddNoteErrorState({required this.errorMassage});
}

class AddNoteLoadingState extends AddNoteState {}
