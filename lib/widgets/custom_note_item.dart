
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:Color(0xffFFCC80)
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 26,left: 16,top: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:const  Text(
                "Flutter Tips",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  "Build Your Career with Tharwat Samy",
                  style: TextStyle(
                   color: Colors.black.withOpacity(.4),
                      fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(onPressed: () {
                
              },icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24,
              ),)
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                  "May 20-12-2023",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                      fontSize: 14,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}