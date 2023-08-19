import 'package:flutter/material.dart';
import 'package:notes_app/views/Notes_view.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     // theme: ThemeData.dark(), ///this is the darktheme in the app
     theme: ThemeData(brightness:Brightness.dark), // to control the app theme responsively
      home: NotesView(),
    );
  }
}