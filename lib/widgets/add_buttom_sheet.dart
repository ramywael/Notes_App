import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 32,horizontal: 16),
      child:   Column(
        // the container is inside the bottomsheet not the reverse
        children: [
          CustomTextField(),
        ],
      ),
    );
  }
}