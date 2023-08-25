import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import '../cubits/addNote/add_note_cubit.dart';
import 'add_note_form.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
 bool isAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: SingleChildScrollView(
        physics:  const ClampingScrollPhysics(),
        child: BlocConsumer(
            builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child : const AddNoteFormState()
          );
        },
        listener: (context, state) {
              if(state is AddNoteFailure)
                {
                  print("Error Message is ${state.message}");
                }
              else if(state is AddNoteSuccess)
                {
                  Navigator.of(context).pop();
                }
        },
      ),
    ),
    );
  }
}
