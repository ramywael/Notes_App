import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';

import 'constants/contant_color.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(
                      () {
                    currentIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                    // it will change the color of the note and gave it to the cubit
                        // And the cubit will give it to the model
                  },
                );
              },
              child: ColorNoteItem(
                isActive: currentIndex == index, color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
