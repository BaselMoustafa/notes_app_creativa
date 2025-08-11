import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/widgets/note_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: notes.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      }, 
      itemBuilder: (context,index){
        return NoteWidget(
          note: notes[index],
        );
      }, 
    );
  }
}