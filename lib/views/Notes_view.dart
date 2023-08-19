import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_buttom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddBottomSheet(
                    //Note when we make a CustomWidget here instead of returning container , it is better because the custom has a build method which it will make the change to ui without hot reload.
                    );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
