import 'package:demo_project/widgets/note-widget.dart';
import 'package:flutter/material.dart';

import '../design/design-system.dart';
import '../models/note-model.dart';

class NotesListWidget extends StatelessWidget {
  NotesListWidget({Key? key, required this.noteModels}) : super(key: key);
  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.SCREEN_HORIZONTAL_PADDING),
        child: Center(
            child: Column(
          children: noteModels
              .asMap()
              .entries
              .map<NoteRowWidget>((nm) => NoteRowWidget(
                    note: nm.value,
                    id: nm.value.id,
                  ))
              .toList(),
        )));
  }
}
