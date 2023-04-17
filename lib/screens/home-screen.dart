import 'package:demo_project/controllers/notes-controller.dart';
import 'package:demo_project/widgets/notes-list-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Märkmik"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/note-screen'),
        ),
        body: FutureBuilder(
            future: Provider.of<NotesController>(context, listen: true).allNotes,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Loading..."));
              }
              return NotesListWidget(noteModels: snapshot.data);
            }
        )
    );
  }
}
