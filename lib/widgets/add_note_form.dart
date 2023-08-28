import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';

import '../models/note_model.dart';
import 'custom_bottom.dart';
import 'custom_text_field.dart';

class AddNoteFormState extends StatefulWidget {
  const AddNoteFormState({
    super.key,
  });

  @override
  State<AddNoteFormState> createState() => _AddNoteFormStateState();
}

class _AddNoteFormStateState extends State<AddNoteFormState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title, subtitle;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        // the container is inside the bottom-sheet not the reverse
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 22,
          ),
          CustomTextField(
            hint: "Description",
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 26,
          ),
          const ColorListView(),
          const SizedBox(
            height: 26,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (BuildContext context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  validateMethod(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }

  void validateMethod(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      DateTime now = DateTime.now();
      var currentTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      //  Navigator.of(context).pop();
      var noteModel = NoteModel(
        title: title!,
        subtitle: subtitle!,
        date: currentTime.toString(),
        color: Colors.blue.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}

class ColorNoteItem extends StatelessWidget {
  const ColorNoteItem({Key? key, required this.isActive, required this.color}) : super(key: key);
  final bool isActive;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 31,
            ),
          )
        :  CircleAvatar(
            backgroundColor: color,
            radius: 34,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors=const[
    Color(0xffC2E812),
    Color(0xff91F5AD),
    Color(0xff8B9EB7),
    Color(0xff745296),
    Color(0xff632A50),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              child: ColorNoteItem(
                isActive: currentIndex == index, color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
