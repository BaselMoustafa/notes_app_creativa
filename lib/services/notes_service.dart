import 'package:hive/hive.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesService {
  
  final String _boxName = "notes";
  Future<List<Note>?> getNotes()async{
    try {
      return Hive.box(_boxName).values.map(
        (ele)=> Note.fromMap(ele)
      ).toList();
    } catch (e) {
      return null;
    }
  }

  Future<Note?> addNote({
    required String title,
    required String content,
  }) async {
    final noteId = Uuid().v4();
    final note = Note(
      id: noteId, 
      title: title, 
      content: content,
    );

    try {
      await Hive.box(_boxName).put(
        noteId, 
        note.toMap(),
      );

      return note;
    } catch (e) {
      return null;
    }  

  }

  Future<Note?> editNote(Note note)async{
    try {
      await Hive.box(_boxName).put(
        note.id,
        note.toMap(),
      );

      return note;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteNote(Note note)async{
    try {
      await Hive.box(_boxName).delete(
        note.id
      );
      return true;
    } catch (e) {
      return false;
    }
  }

}