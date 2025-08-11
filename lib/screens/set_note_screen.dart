import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/custom_text_form_field.dart';

class SetNoteScreen extends StatelessWidget {
  const SetNoteScreen({
    super.key,
    required this.note,
  });

  final Note? note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        title: Text(
          note ==null?"Add Note":"Edit Note",
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: AppTextStyles.regular22,
          ),

          CustomTextFormField(),

          Text(
            "Content",
            style: AppTextStyles.regular22,
          )
        ],
      ),
    );
  }
}