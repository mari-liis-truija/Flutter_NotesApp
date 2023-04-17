class NoteModel {
  String? id; // addNote ja editNote läheb id alla selliselt, et edit toimib ainult id järgi ja kirjutab üle eelneva
  late String title;
  late String message;
  late DateTime date;
  String? weather;

  // funktsioon, konverteerime map-i mitte JSONisse, et saaks mappi salvestada andmebaasi
  Map<String, dynamic> toMap() { // dynamic - iga väärtus dart-is
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["title"] = title;
    map["message"] = message;
    map["date"] = date.toString();
    return map;
  }
}

  List<NoteModel> getTestNotes(){
  var note1 = NoteModel();
  note1.title = "Title1";
  note1.message = "Test Message";
  note1.date = DateTime.now();

  var note2 = NoteModel();
  note2.title = "Title 2";
  note2.message = "Test Message 2";
  note2.date = DateTime.now();
  return [note1, note2];
}