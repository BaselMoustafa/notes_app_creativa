import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Notes App",
          style: AppTextStyles.regular22.copyWith(
            color: AppColors.white
          ),
        ),
      ),
      body: Column(
        children: [
          NoteWidget(
            note: Note(
              title: "Title 1",
              content: "ASHVDJHASVFJHASDVJHFDS"
            ),
          )
        ],
      ),
    );
  }
}