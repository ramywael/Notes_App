import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import '../cubits/addNote/add_note_cubit.dart';
import 'add_note_form.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
        if (state is AddNoteFailure) {
        print('failied  ${state.errMessage}');
        }

        if (state is AddNoteSuccess) {
        Navigator.pop(context);
        }
        },
        builder: (context, state) {
        return ModalProgressHUD(
        inAsyncCall: state is AddNoteLoading ? true : false,
        child: const SingleChildScrollView(
        child: AddNoteFormState(),
        ),
        );
        },


          ),
      ),
    );
  }
}

//Why the state is not updating ?
//Why the loading is not showing ?
