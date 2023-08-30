import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';

import '../cubits/addNote/add_note_cubit.dart';
import 'add_note_form.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        // it is advisable to use BlocListener instead of BlocConsumer when you don't want to rebuild the ui
        //As we rebuild the CustomButton
        //But we will use absorber to  prevent the user from entering the same note twice while loading
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child:  Padding(
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom
              //this will make the bottom sheet take the size of the screen
                //And Make the keyboard not cover the bottom sheet
              ),
              child:const SingleChildScrollView(
                child: AddNoteFormState(),
              ),
            ),
          );
        },
//if i want to make the loading indicator take the same size of the screen before loading i should make the padding the child of the modal progress hud
      ),
    );
  }
}


