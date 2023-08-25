import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../widgets/constants/contant_color.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

 void addNote (NoteModel model)
 {
   ///This function should take the note-model to add it to the database
  try{
    emit(AddNoteLoading());
   var noteBox = Hive.box<NoteModel>(kConstantNoteBox);
    noteBox.add(model);
    emit(AddNoteSuccess());
 }catch(e){
   emit(AddNoteFailure(message: e.toString()));
 }
 }

}
