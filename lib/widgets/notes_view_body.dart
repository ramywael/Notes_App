import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
    super.initState();
    //it called when the widget is inserted in the widget tree
    //it called before the build method
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
           SizedBox(height: 50,),
          CustomAppBar(title: 'Notes',icon: Icons.search,),
          Expanded(child: CustomNotesList()),
        ],
      ),
    );
  }
}

