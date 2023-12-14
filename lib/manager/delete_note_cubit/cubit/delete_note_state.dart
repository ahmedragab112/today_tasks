class DeleteNoteState {}

class DeleteNoteInitial extends DeleteNoteState {}

class DeleteNoteSuccessState extends DeleteNoteState {}

class DeleteNoteLoadingState extends DeleteNoteState {}

class DeleteNoteErrorState extends DeleteNoteState {
  final String errorMassage;

  DeleteNoteErrorState({required this.errorMassage});
}
