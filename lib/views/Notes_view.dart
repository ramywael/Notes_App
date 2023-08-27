import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/widgets/add_buttom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NoteViewCubit>(create: (BuildContext context) => NoteViewCubit(),
      child: const NotesViewBody()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
             // it makes the bottom sheet to be full screen
             showDragHandle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return  const AddBottomSheet(
                    //Note when we make a CustomWidget here instead of returning container , it is better because the custom has a build method which it will make the change to ui without hot reload.
                    );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
//What is the functionality of the attribute showDragHandle ?
