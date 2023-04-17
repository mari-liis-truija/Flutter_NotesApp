import 'package:demo_project/models/note-model.dart';
import 'package:demo_project/widgets/my-icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteRowWidget extends StatelessWidget {
  const NoteRowWidget({Key? key, required this.note, required this.id}) : super(key: key);
  final NoteModel note;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // tuvastab klikke
      onTap: () => Navigator.of(context).pushNamed('/note-screen', arguments: id),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: [
          MyIcon(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(note.title, style: Theme.of(context).textTheme.titleLarge,),
              Text(note.message, style: Theme.of(context).textTheme.bodyMedium,),
            ],),
          ),
          const Spacer(),
          Text(DateFormat('dd.MM').format(note.date))
        ],),
      ),
    );
  }
}
