import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

import '../models/note_model.dart';

class CustomNotesList extends StatelessWidget {
  const CustomNotesList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<NoteViewCubit,NoteViewState>(
        builder: (BuildContext context, state) {
          List<NoteModel> notes =BlocProvider.of<NoteViewCubit>(context).notes!;
          return  ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child:  CustomNoteItem(note: notes[index],),
              );
            },
          );
        },
      ),
    );
  }
}


