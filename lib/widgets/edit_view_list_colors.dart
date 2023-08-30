import 'package:flutter/cupertino.dart';

import '../models/note_model.dart';
import 'colors_list.dart';
import 'constants/contant_color.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}
class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                    widget.note.color = kColors[index].value;
                  },
                );
              },
              child: ColorNoteItem(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
