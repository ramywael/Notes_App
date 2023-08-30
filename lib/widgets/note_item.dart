import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../views/Notrs_edit_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NotesEditView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 26, left: 16, top: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      note.subtitle,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialogForDeleting(context);
                      // note.delete();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 24,
                    ),
                  )),
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

  void showDialogForDeleting(BuildContext context) {
    showDialog(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Are you sure?"),
          content: const Text("Do you want to delete this note?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                note.delete();
                BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),
            ),
          ],
          backgroundColor: Color(note.color),
          //     backgroundColor: BlocProvider.of<NoteViewCubit>(context).notes!.map((e) => e.color).toList().contains(note.color) ? Color(note.color) : kConstantPrimaryColor,
        );
      },
    );
  }
}
