import 'package:demo_project/controllers/random-number-generator.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';

import '../widgets/note-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  num rand = getRandomNumber();

  void getNewNum() {
    setState(() {
      rand = getRandomNumber();
    });
  }

  List<Widget> getNotes() {
    List<NoteModel> noteModels = getTestNotes();
    List<Widget> noteWidgets = [];
    for(int i = 0; i < noteModels.length ; i++){
      noteWidgets.add(NoteRowWidget(note: noteModels[i]));
    }
    return noteWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Märkmik'),),
      body: Center(child: Column(
        children: getTestNotes().map((note) => NoteRowWidget(note: note)).toList(), //toList() - konverteerib Listiks
      )),
    );

    // return const Placeholder();
  }
}
