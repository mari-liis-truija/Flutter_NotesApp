import 'dart:async';
import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:sqflite/sqflite.dart'; // https://pub.dev/packages/sqflite/install
import 'package:path/path.dart';

class SqlPersistence extends Persistence { // hakkab kasutama SQLflite andmebaasi
  // Persistence tuleb persistence.dart failist
  static final SqlPersistence _instance = SqlPersistence.internal();

  factory SqlPersistence() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  SqlPersistence.internal();

  initDb() async { // initDb() - leiab andmebaasi, leiab õiged tabelid, avab andmebaasi, loob tabeli
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async { // loob andmebaasi väljad
    await db.execute('CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, message TEXT, date TEXT)');
  } // AUTOINCREMENT - tahame, et andmebaas ise looks id, mitte, et anname ise kaasa

  @override
  Future<int> saveNote(NoteModel note) async {
    var dbClient = await db;
    late int res;
    if (note.id == null) { //
      res = await dbClient.insert("Notes", note.toMap());
    }
    else {
      res = await dbClient.update("Notes", note.toMap(), where: 'id=${note.id}');
    }
    return res;
  }

  @override
  Future<List<NoteModel>> getAllNotes() async { // getAllNotes() - võtab andmebaasi
    var dbClient = await db; // dbClient - jooksutab päringu
    List<Map<String, dynamic>> list = await dbClient.rawQuery('SELECT * FROM Notes'); //päring tagastab nimekirja map objektidest <Map<String, dynamic>>
    List<NoteModel> notes = [];
    for (var i = 0; i < list.length; i++) {
      NoteModel note = NoteModel();
      note.id = list[i]['id']; // iga Map-i kohta loome uue note-i
      note.title = list[i]['title'];
      note.message = list[i]['message'];
      note.date = DateTime.parse(list[i]['date']);
      notes.add(note);
    }
    return notes; // ja siis tagastame note-i
  }

  Future<int> deleteAllNotes() async { // pole implementeerinud
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM Notes');
    return res;
  }

  @override
  Future<NoteModel> getNote(String id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.rawQuery('SELECT * FROM Notes WHERE id=$id');
    NoteModel note = NoteModel();
    note.id = (result[0]["id"]); // result[0] - esimene tulemus, ["id"] - väli
    note.title = result[0]["title"];
    note.message = result[0]["message"];
    note.date = DateTime.parse(result[0]["date"]);
    return note;
  }
}
