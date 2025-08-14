import 'package:flutter/material.dart';
import 'package:notes_app_creativa/models/note.dart';
import 'package:notes_app_creativa/style/app_colors.dart';
import 'package:notes_app_creativa/style/app_text_styles.dart';
import 'package:notes_app_creativa/widgets/home_screen_floating_action_button.dart';
import 'package:notes_app_creativa/widgets/notes_list_view.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: NotesListView(
        notes: notes,
        onSetNote: setNote,
        onDeleteNote: deleteNote,
      ),
      floatingActionButton: HomeScreenFloatingActionButton(
        onSetNote: setNote,
      ),
    );
  }

  void deleteNote(Note note){
    notes.removeWhere(
      (a)=>a.id==note.id,
    );
    setState(() {
      
    });
  }

  void setNote(Note note){
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].id == note.id) {
        notes[i]=note;
        setState(() {
          
        });
        return ;
      }
    }


    notes.insert(0, note);
    setState(() {
      
    });
  }

  final List<Note> notes=[
    Note(
      id:Uuid().v4(),
      title:"Client Feedback - Mobile App Redesign", 
      content:"Positive feedback on the login screen; change header font."
    ),
    Note(
      id:Uuid().v4(),
      title:"Buy groceries",
      content:"Milk, eggs, bread, and some fresh fruits and vegetables."
    ),
    Note(
      id:Uuid().v4(),
      title:"Meeting Notes",
      content:"Discussed UI updates, backend API issues, and upcoming deadlines."
    ),
    Note(
      id:Uuid().v4(),
      title:"Ideas",
      content:"Create a mobile app to track personal habits and routines."
    ),
    Note(
      id:Uuid().v4(),
      title:"Weekend Plan",
      content:"Visit parents, deep clean kitchen, and go for a long walk."
    ),
    Note(
      id:Uuid().v4(),
      title:"Read Later",
      content:"Read Flutter performance tips article shared by Mohamed."
    ),
    Note(
      id:Uuid().v4(),
      title:"Quick Todo",
      content:"Send report, charge phone, water the plants."
    ),
    Note(
      id:Uuid().v4(),
      title:"Birthday Gift",
      content:"Look for a cool leather wallet or smartwatch."
    ),
    Note(
      id:Uuid().v4(),
      title:"Workout Routine",
      content:"Full body Monday, rest Tuesday, arms Wednesday, and cardio Thursday."
    ),
    Note(
      id:Uuid().v4(),
      title:"Flutter Animations",
      content:"Check `Hero` animations and `AnimatedContainer` for smooth transitions."
    ),
    Note(
      id:Uuid().v4(),
      title:"Short",
      content:"Tiny one."
    ),
    Note(
      id:Uuid().v4(),
      title:"Books to Read",
      content:"The Pragmatic Programmer, Deep Work, and Clean Architecture."
    ),
    Note(
      id:Uuid().v4(),
      title:"Design Refactor",
      content:"Split the dashboard UI into widgets and use `BlocBuilder` wisely."
    ),
    Note(
      id:Uuid().v4(),
      title:"Flight Booking",
      content:"Book ticket to Istanbul, Oct 15–22. Check Airbnb prices."
    ),

  ];
}

