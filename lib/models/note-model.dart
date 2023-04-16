class NoteModel {
  late String title;
  late String message;
  late DateTime date;
  late String emoji;
  String? weather;
}

  List<NoteModel> getTestNotes(){
  var note1 = NoteModel();
  note1.title = "Title1";
  note1.message = "Test Message";
  note1.date = DateTime.now();
  note1.emoji = "👍";

  var note2 = NoteModel();
  note2.title = "Title 2";
  note2.message = "Test Message 2";
  note2.date = DateTime.now();
  note2.emoji = "👍";
  return [note1, note2];
}