import 'package:bloc/bloc.dart';
import 'package:notehive/manager/delete_note_cubit/cubit/delete_note_state.dart';


class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());
}
