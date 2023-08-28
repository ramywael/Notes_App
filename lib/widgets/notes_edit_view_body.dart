import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'colors_list.dart';
import 'constants/contant_color.dart';

class NotesEditViewBody extends StatefulWidget {
  const NotesEditViewBody({super.key, required this.note});
  // static const String routeName = '/notes_edit_view_body';
  final NoteModel note;

  @override
  State<NotesEditViewBody> createState() => _NotesEditViewBodyState();
}

class _NotesEditViewBodyState extends State<NotesEditViewBody> {
  String? title,
      content; //the user can edit both or one of them so they can be null
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SafeArea(
              child: CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = content ?? widget.note.subtitle;
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
            const SizedBox(height: 14),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subtitle,
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 14),
            ),
            const SizedBox(height: 25),
            EditColorListVuew(note: widget.note,),
          ],
        ),
      ),
    );
  }
}

class EditColorListVuew extends StatefulWidget {
  const EditColorListVuew({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditColorListVuew> createState() => _EditColorListVuewState();
}

class _EditColorListVuewState extends State<EditColorListVuew> {

late  int currentIndex ;
  @override
  void initState() {
     currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(
                      () {
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                  },
                );
              },
              child: ColorNoteItem(
                isActive: currentIndex == index, color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}


