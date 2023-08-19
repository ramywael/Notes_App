
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  const BoxDecoration(
        color:Color(0xffFFCC80)
      ),
      child: const ListTile(
        title: Text(
          "Flutter Tips",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          "Build Your Career with Ramy Wael",
        ),
        trailing: Icon(
          FontAwesomeIcons.trash,
        ),
      ),
    );
  }
}