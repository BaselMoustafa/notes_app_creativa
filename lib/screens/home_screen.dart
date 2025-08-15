import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/services/notes_service.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/home_screen_floating_action_button.dart';
import 'package:notes_app_creativa/widgets/notes_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note>? notes=[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setInitialValueToNotes();
  }

  Future<void> setInitialValueToNotes()async{
    notes = await NotesService().getNotes();
    isLoading=false;
    setState(() {
      
    });
  }

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
      body: isLoading? Center(child: CircularProgressIndicator()):(
          notes==null? Text("Error"): NotesListView(
          notes: notes!,
          onSetNote: setNote,
          onDeleteNote: deleteNote,
        )
      ),
      floatingActionButton: HomeScreenFloatingActionButton(
        onSetNote: setNote,
      ),
    );
  }

  void deleteNote(Note note){
    notes!.removeWhere(
      (a)=>a.id==note.id,
    );
    setState(() {
      
    });
  }

  void setNote(Note note){
    for (var i = 0; i < notes!.length; i++) {
      if (notes![i].id == note.id) {
        notes![i]=note;
        setState(() {
          
        });
        return ;
      }
    }


    notes!.insert(0, note);
    setState(() {
      
    });
  }
}

