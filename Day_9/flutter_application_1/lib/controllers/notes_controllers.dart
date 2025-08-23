import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/dp_model.dart';
import 'package:flutter_application_1/models/notes_model.dart';

class NotesController extends ChangeNotifier {
  final NoteDb _db = NoteDb();
  final List<Note> notes = [];

  Future<void> addNote(Note note) async {
    final id = await _db.insertNote(
      note.title,
      note.description,
      note.day,
      note.hour,
    );
    notes.add(
      Note(
        id: id,
        title: note.title,
        description: note.description,
        day: note.day,
        hour: note.hour,
      ),
    );
    notifyListeners();
  }

  Future<void> removeNote(int id) async {
    await _db.deleteNote(id);
    notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  Future<void> fetchNotes() async {
    final db = await _db.database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    notes.clear();
    notes.addAll(maps.map((map) => Note.fromMap(map)).toList());
    notifyListeners();
  }
}
