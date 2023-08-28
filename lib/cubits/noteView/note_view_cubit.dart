import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';
import '../../widgets/constants/contant_color.dart';

part 'note_view_state.dart';

class NoteViewCubit extends Cubit<NoteViewState> {
  NoteViewCubit() : super(NoteViewInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
      var notesBox = Hive.box<NoteModel>(kConstantNoteBox);
       notes = notesBox.values.toList();
       if(notes!.isEmpty)
         {
           emit(NoteViewInitial());
         }else
           {
             emit(NoteViewSuccess());
           }
       //emit(NoteViewSuccess());
  }
}


