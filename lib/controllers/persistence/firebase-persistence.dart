import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

class FirebasePersistence extends Persistence {
  FirebaseApp? _firebaseApp;
  late FirebaseFirestore db;

  Future<void> init() async {
    if (_firebaseApp == null) {
      _firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      db = FirebaseFirestore.instance;
    }
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    await init();
    List<NoteModel> notes = [];
    var results = (await db.collection('notes').get()).docs;
    for (var element in results) {
      if (element.data().isNotEmpty) {
        NoteModel note = NoteModel();
        note.id = element.id;
        note.title = element.data()['title'];
        note.message = element.data()['message'];
        note.date = DateTime.parse(element.data()['date']);
        notes.add(note);
      }
    }
    return notes;
  }

  @override
  Future<NoteModel> getNote(String id) async {
    await init();
    var result = await db.collection('notes').doc(id).get();
    NoteModel note = NoteModel();
    if (result.data() != null) {
      note.id = result.id;
      note.title = result.data()!['title'];
      note.message = result.data()!['message'];
      note.date = DateTime.parse(result.data()!['date']);
    }
    return note;
  }

  @override
  Future<void> saveNote(NoteModel note) async {
    await init();
    await db.collection('notes').add(note.toMap());
  }
}
