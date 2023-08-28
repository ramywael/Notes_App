
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/notes_edit_view_body.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NotesEditViewBody.routeName);
      },
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color)
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 26,left: 16,top: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16,bottom: 16),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                     color: Colors.black.withOpacity(.4),
                        fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(onPressed: () {
                  note.delete();
                  BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
                },icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),)
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                    note.date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.4),
                        fontSize: 14,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




