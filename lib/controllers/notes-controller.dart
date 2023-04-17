import 'package:demo_project/controllers/persistence/firebase-persistence.dart';
import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:flutter/material.dart';
import '../models/note-model.dart';

class NotesController extends ChangeNotifier{ // ChangeNotifier - iga kord kui kutsutakse funktsioon add välja, annab kõigile widgetitele teada, et nad peaksid uuendama enanst
  //List<NoteModel> notes = [];
  Persistence persistence = FirebasePersistence(); // Only place to tell the whole app whether to use SQL or firebase
  Future<List<NoteModel>> get allNotes {
    return persistence.getAllNotes();
  }

  Future<void> saveNote(String? id, NoteModel note) async {
    await persistence.saveNote(note);
    notifyListeners();
  }

  Future<NoteModel> getNote(String id) async {
    return persistence.getNote(id);
  }
}