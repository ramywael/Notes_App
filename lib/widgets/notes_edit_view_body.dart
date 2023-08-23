import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NotesEditViewBody extends StatelessWidget {
  const NotesEditViewBody({super.key});
  static const String routeName = '/notes_edit_view_body';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(height: 26,),
            CustomTextField(
              hint: "Title",
            ),
            SizedBox(height: 14),
            CustomTextField(
              hint: "Content",
              padding: EdgeInsets.symmetric(vertical: 65,horizontal: 14),
            ),
          ],
        ),
      ),
    );
  }
}
