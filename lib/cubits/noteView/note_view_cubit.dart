import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';
import '../../widgets/constants/contant_color.dart';

part 'note_view_state.dart';

class NoteViewCubit extends Cubit<NoteViewState> {
  List<NoteModel>? notes;
  NoteViewCubit() : super(NoteViewInitial());
  fetchAllNotes() {
      var notesBox = Hive.box<NoteModel>(kConstantNoteBox);
       notes = notesBox.values.toList();
  }
}
