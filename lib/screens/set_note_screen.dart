import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/services/notes_service.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/custom_button.dart';
import 'package:notes_app_creativa/widgets/custom_text_form_field.dart';

class SetNoteScreen extends StatefulWidget {
  const SetNoteScreen({
    super.key,
    required this.note,
    required this.onSetNote,
  });

  final Note? note;
  final void Function(Note settedNote) onSetNote;

  @override
  State<SetNoteScreen> createState() => _SetNoteScreenState();
}

class _SetNoteScreenState extends State<SetNoteScreen> {
  final TextEditingController titleController=TextEditingController();
  final TextEditingController contentController=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note?.title ?? "";
    contentController.text=widget.note?.content ??"";

  }

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

      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Text(
                  "Title",
                  style: AppTextStyles.regular22,
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextFormField(
                  controller: titleController,
                  hintText: "Write Your Title Here...",
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Content",
                  style: AppTextStyles.regular22,
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: CustomTextFormField(
                  controller: contentController,
                  hintText: "Write Your Content Here...",
                  maxLines: 7,
                ),
              ),
            ),

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20 
                  ),
                  child: CustomButton(
                    title: "Save",
                    onTap: () async{
                      if (! formKey.currentState!.validate()) {
                        return ;
                      }

                      final service = NotesService();
                      Note? settedNote;

                      if (widget.note ==null) {
                        settedNote = await service.addNote(
                          title: titleController.text, 
                          content: contentController.text,
                        );
                      }else{
                        settedNote = await service.editNote(
                          Note(
                            id: widget.note!.id,
                            title: titleController.text, 
                            content: contentController.text,
                          )
                        );
                      }

                      if (settedNote!=null) {
                        widget.onSetNote(
                          settedNote

                        );
                        Navigator.of(context).pop();
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Try Again"))
                        );
                      }
                      
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}