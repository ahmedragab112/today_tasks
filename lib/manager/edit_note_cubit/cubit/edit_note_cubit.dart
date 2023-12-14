import 'package:bloc/bloc.dart';
import 'package:notehive/manager/edit_note_cubit/cubit/edit_note_state.dart';


class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
}
