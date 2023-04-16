import 'package:demo_project/controllers/notes-controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note-model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, this.noteModel}) : super(key: key);
  final NoteModel?
      noteModel; // ? - parameeter noteModel võib ja võib ka mitte tulla

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteModel note = NoteModel();
  late int? position; //late - ära muretse, see pole praegu täidetud väärtusega
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  initNote(BuildContext context) { //abistav funktsioon
    position = ModalRoute.of(context)?.settings.arguments as int?;
    if (position == null) {
      note.message = "This is a test message ";
      note.title = "Demo note";
      note.emoji = "🔥";
      note.date = DateTime.now();
    }
    else {
      note = Provider.of<NotesController>(context).getNote(position!);
    }

    titleController.text = note.title;
    messageController.text = note.message;
  }


  @override
  Widget build(BuildContext context) {
    initNote(context);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          note.title = titleController.value.text;
          note.message = messageController.value.text;
          if (position == null) {
            Provider.of<NotesController>(context, listen: false).addNote(note);
          }
          else {
            Provider.of<NotesController>(context, listen: false)
                .editNote(position!, note);
          }
          Navigator.of(context).pop(); // navigeerime tagasi
        },
        child: Icon(Icons.check),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  onSubmitted: (text) => titleController.text = text,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                      controller: messageController,
                      onSubmitted: (text) => messageController.text = text,
                      maxLines: 16,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Your Message",
                        hintText: "Tell me your thoughts",
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
