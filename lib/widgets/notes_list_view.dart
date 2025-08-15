import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/widgets/note_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.notes,
    required this.onSetNote,
    required this.onDeleteNote
  });


  final void Function(Note note) onSetNote;
  final List<Note> notes;
  final void Function(Note note) onDeleteNote;

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Text("There Are No Notes");
    }
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: notes.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      }, 
      itemBuilder: (context,index){
        return NoteWidget(
          onDeleteNote: onDeleteNote,
          onSetNote: onSetNote,
          note: notes[index],
        );
      }, 
    );
  }
}