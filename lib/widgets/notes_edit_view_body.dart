import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NotesEditViewBody extends StatefulWidget {
  const NotesEditViewBody({super.key, required this.note});
  // static const String routeName = '/notes_edit_view_body';
  final NoteModel note;

  @override
  State<NotesEditViewBody> createState() => _NotesEditViewBodyState();
}

class _NotesEditViewBodyState extends State<NotesEditViewBody> {
  String? title, content; //the user can edit both or one of them so they can be null
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
          const  SizedBox(
              height: 20,
            ),
            SafeArea(
              child: CustomAppBar(
                title: 'Edit Note', icon: Icons.check,onPressed: () {
                widget.note.title=title ?? widget.note.title;
                widget.note.subtitle=content ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              ),
            ),
           const SizedBox(
              height: 26,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
        const    SizedBox(height: 14),
            CustomTextField(
              onChanged: (value) {
               content = value;
              },
              hint: widget.note.subtitle,
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 14),
            ),
          ],
        ),
      ),
    );
  }
}
