import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/screens/set_note_screen.dart';
import 'package:notes_app_creativa/services/notes_service.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
    required this.onSetNote,
    required this.onDeleteNote,
  });

  final Note note;
  final void Function(Note note) onSetNote;
  final void Function(Note note) onDeleteNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: _getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  note.title,
                  style: AppTextStyles.bold22,
                
                ),
              ),

              PopupMenuButton<VoidCallback>(
                color: AppColors.primary,
                iconColor: AppColors.primary,
                onSelected: (VoidCallback toExcute) {
                  toExcute.call();
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SetNoteScreen(
                                note: note,
                                onSetNote: onSetNote,
                              );
                            },
                          )
                        );
                      },
                      child: _ActionButton(
                        iconData: Icons.edit, 
                        title: "Edit",
                      ),
                    ),
                    PopupMenuItem(
                      value: ()async{
                        final serivice = NotesService();
                        bool isDeleted = await serivice.deleteNote(note);
                        if (isDeleted) {
                          onDeleteNote(note);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please Try Again"))
                          );
                        }
                      },
                      child: _ActionButton(
                        iconData: Icons.delete, 
                        title: "Delete",
                      ),
                    ),
                  ];
                },
              )

            ],
          ),

          SizedBox(height: 10,),

          Text(
            note.content,
          ),
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: AppColors.grey,
          blurRadius: 5
        )
      ]
    );
  }

}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.iconData,
    required this.title
  });

  final IconData iconData;
  final String title;  

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(
          iconData,
          color: AppColors.white,
        ),
        Text(
          title,
          style: AppTextStyles.regular16.copyWith(
            color: AppColors.white
          ),
        )
      ],
    );
  }
}