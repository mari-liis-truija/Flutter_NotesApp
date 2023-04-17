import 'package:demo_project/models/note-model.dart';

abstract class Persistence {
  Future<void> saveNote(NoteModel note); // Future - asünkroonne kutse
  Future<NoteModel> getNote(String id);  // peame teadma string id-d sest ss teame teda tagastada
  Future<List<NoteModel>> getAllNotes();
}
