import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:demo_project/controllers/persistence/sql-persistence.dart';
import 'package:flutter/material.dart';
import '../models/note-model.dart';

class NotesController extends ChangeNotifier{ // ChangeNotifier - iga kord kui kutsutakse funktsioon add välja, annab kõigile widgetitele teada, et nad peaksid uuendama enanst
  //List<NoteModel> notes = [];

  Persistence persistence = SqlPersistence(); // saame kasutada ainult persistence.dart meetodeid

  Future<List<NoteModel>> get allNotes {
    return persistence.getAllNotes();
  }

  Future<void> saveNote(int? id, NoteModel note) async {
    await persistence.saveNote(note);
    notifyListeners();
  }

  Future<NoteModel> getNote(int position) async {
    return persistence.getNote(position);
  }
}
