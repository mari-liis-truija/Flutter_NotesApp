import 'package:flutter/material.dart';

import '../models/note-model.dart';

class NotesController extends ChangeNotifier{ // ChangeNotifier - iga kord kui kutsutakse funktsioon add välja, annab kõigile widgetitele teada, et nad peaksid uuendama enanst
  List<NoteModel> notes = [];

  List<NoteModel> getAllNotes() {
    return notes;
  }

  List<NoteModel> get allNotes {
    return notes;
  }

  void addNote(NoteModel note) {
    notes.add(note);
    notifyListeners();
  }

  void editNote(int position, NoteModel note) {
    notes[position] = note;
    notifyListeners();
  }

  NoteModel getNote(int position) {
    return notes[position]; //position - List<NoteModel> getAllNotes() küsib jada positsiooni, kui tahab mingit kindlat note-i kätte saada
  }
}
