import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants/contant_color.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const CustomTextField(
      {super.key, required this.hint, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
        cursorColor: kConstantPrimaryColor,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color:Color(0xff62FCD7),
            ),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kConstantPrimaryColor)));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
