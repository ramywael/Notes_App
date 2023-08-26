import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/widgets/constants/contant_color.dart';
import 'package:notes_app/widgets/notes_edit_view_body.dart';
import 'cubits/addNote/add_note_cubit.dart';
import 'observer/simple_observer.dart';

void  main() async {
  await Hive.initFlutter();
  Bloc.observer= SimpleObserver();
  //it saves my time and help me to debug the app and know what is happening in the app(states)
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kConstantNoteBox) ;
    runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});


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