import 'package:flutter/material.dart';
import 'package:notes_app_creativa/screens/set_note_screen.dart';
import 'package:notes_app_creativa/style/app_colors.dart';

class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    backgroundColor: AppColors.primary,
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=>SetNoteScreen(note: null) 
        )
      );
    },
    child: Icon(
      Icons.add,
      color: AppColors.white,
    ),
  );
  }
}