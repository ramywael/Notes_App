import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/views/Notes_view.dart';
import 'package:notes_app/widgets/constants/contant_color.dart';
import 'package:notes_app/widgets/notes_edit_view_body.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(kConstantNoteBox);
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        NotesEditViewBody.routeName: (context) => const  NotesEditViewBody(),
      },
      debugShowCheckedModeBanner: false,
     // theme: ThemeData.dark(), ///this is the darktheme in the app
     theme: ThemeData(brightness:Brightness.dark,fontFamily: 'Poppins'), // to control the app theme responsively
      home: NotesView(),
    );
  }
}