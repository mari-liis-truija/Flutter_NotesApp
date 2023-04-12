import 'package:demo_project/controllers/random-number-generator.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:demo_project/widgets/notes-list-widget.dart';
import 'package:flutter/material.dart';

import '../widgets/note-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  num rand = getRandomNumber();
  List<NoteModel> noteModels = [];

  void getNewNum() {
    setState(() {
      rand = getRandomNumber();
    });
  }

  List<Widget> getNotes() {
    List<Widget> noteWidgets = [];
    for(int i = 0; i < noteModels.length ; i++){
      noteWidgets.add(NoteRowWidget(note: noteModels[i]));
    }
    return noteWidgets;
  }

  @override
  Widget build(BuildContext context) {
    NoteModel? note = ModalRoute.of(context)!.settings.arguments as NoteModel?;
    if(note != null) {
      noteModels.add(note);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Märkmik'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/note-screen'),
      ),
      body: NotesListWidget(noteModels: noteModels,),
    );

    // return const Placeholder();
  }
}
