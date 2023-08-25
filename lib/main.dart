import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/Notes_view.dart';
import 'package:notes_app/widgets/constants/contant_color.dart';
import 'package:notes_app/widgets/notes_edit_view_body.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(kConstantNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
         BlocProvider<AddNoteCubit>(
           create: (context) => AddNoteCubit(),
           // it make an instance of addNoteCubit and provide it to the widget tree
         ),
      ],
      child: MaterialApp(
        routes: {
          NotesEditViewBody.routeName: (context) => const  NotesEditViewBody(),
        },
        debugShowCheckedModeBanner: false,
       // theme: ThemeData.dark(), ///this is the darktheme in the app
       theme: ThemeData(brightness:Brightness.dark,fontFamily: 'Poppins'), // to control the app theme responsively
        home: NotesView(),
      ),
    );
  }
}