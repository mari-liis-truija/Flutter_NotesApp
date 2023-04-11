import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteRowWidget extends StatelessWidget {
  const NoteRowWidget({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.ac_unit_rounded),
      Column(children: [
        Text(note.title),
        Text(note.message),
      ],),
      Text(DateFormat('dd.MM').format(note.date))
    ],);
  }
}
