import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

 void addNote (NoteModel model)
 {
   ///This function should take the note-model to add it to the database
   //TODO: Add note to database
 }

}
