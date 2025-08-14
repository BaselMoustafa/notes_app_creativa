import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/custom_button.dart';
import 'package:notes_app_creativa/widgets/custom_text_form_field.dart';

class SetNoteScreen extends StatefulWidget {
  const SetNoteScreen({
    super.key,
    required this.note,
  });

  final Note? note;

  @override
  State<SetNoteScreen> createState() => _SetNoteScreenState();
}

class _SetNoteScreenState extends State<SetNoteScreen> {
  final TextEditingController titleController=TextEditingController();
  final TextEditingController contentController=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        title: Text(
          widget.note ==null?"Add Note":"Edit Note",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                "Title",
                style: AppTextStyles.regular22,
              ),
          
              CustomTextFormField(
                controller: titleController,
                hintText: "Write Your Title Here...",
              ),
          
              Text(
                "Content",
                style: AppTextStyles.regular22,
              ),
          
              CustomTextFormField(
                controller: contentController,
                hintText: "Write Your Content Here...",
                maxLines: 7,
              ),
          
             
          
              CustomButton(
                title: "Save",
                onTap: () {
                  print("Saved====");
                  formKey.currentState!.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}