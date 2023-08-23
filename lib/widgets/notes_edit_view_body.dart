
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class NotesEditViewBody extends StatelessWidget {
  const NotesEditViewBody({super.key});
  static const String routeName = '/notes_edit_view_body';

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50,),
           CustomAppBar(title: 'Edit Note',icon: Icons.check),
          ],
        ),
      ),
    );
  }
}

