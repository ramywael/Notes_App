import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_edit_view_body.dart';

import '../models/note_model.dart';

class NotesEditView extends StatelessWidget {
  const NotesEditView({super.key, required this.note});
  final NoteModel note;


  @override
  Widget build(BuildContext context) {
    return  NotesEditViewBody(note: note,);
  }
}


