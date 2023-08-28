import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';

import '../models/note_model.dart';
import 'custom_botton.dart';
import 'custom_text_field.dart';

class AddNoteFormState extends StatefulWidget {
  const AddNoteFormState({
    super.key,
  });

  @override
  State<AddNoteFormState> createState() => _AddNoteFormStateState();
}

class _AddNoteFormStateState extends State<AddNoteFormState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title, subtitle;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        // the container is inside the bottom-sheet not the reverse
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 22,
          ),
          CustomTextField(
            hint: "Description",
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 26,
          ),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (BuildContext context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: ()  {
                  if (formKey.currentState?.validate() ?? false) {
                    formKey.currentState?.save();
                    DateTime now = DateTime.now();
                    var currentTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                    //  Navigator.of(context).pop();
                    var noteModel= NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: currentTime.toString(),
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },

          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}



