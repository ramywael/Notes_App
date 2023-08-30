
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteView/note_view_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list.dart';
import 'package:notes_app/widgets/search_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteViewCubit>(context).fetchAllNotes();
    super.initState();
    //it called when the widget is inserted in the widget tree
    //it called before the build method
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child:
          BlocBuilder<NoteViewCubit, NoteViewState>(builder: (context, state) {
        if (state is NoteViewSuccess) {
          return  Column(
            children: [
           const   SizedBox(
                height: 20,
              ),
              SafeArea(
                child: CustomAppBar(
                  title: 'Notes',
                  icon: Icons.search,
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchData(),
                    );

                  },
                ),
              ),
           const   Expanded(child: CustomNotesList()),
            ],
          );
        } else {
          return Column(
            children: [
           const   SizedBox(
                height: 6,
              ),
            const  SafeArea(
                child: CustomAppBar(
                  title: 'Notes',
                  icon: Icons.search,
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              Image.asset(
                'lib/assets/images/doings.png',
                height: 90,
                width: 90,
                color: Colors.black.withOpacity(0.6),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'You almost done your tasks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
