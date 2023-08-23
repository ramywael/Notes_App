
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants/contant_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,// it will take the width of the screen which will make it responsive
      decoration: BoxDecoration(
        color: kConstantPrimaryColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child:const Center(
        child:  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Add",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}