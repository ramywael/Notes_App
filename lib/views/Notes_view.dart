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
              context: context,
              builder: (context) {
                return const AddBottomSheet();
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}

