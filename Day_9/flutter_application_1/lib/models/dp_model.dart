import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDb {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            day TEXT NOT NULL,
            hour TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertNote(
    String title,
    String description,
    String day,
    String hour,
  ) async {
    final db = await database;
    return await db.insert('notes', {
      'title': title,
      'description': description,
      'day': day,
      'hour': hour,
    });
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateNote(
    int id, {
    String? title,
    String? description,
    String? day,
    String? hour,
  }) async {
    final db = await database;

    Map<String, dynamic> updates = {};
    if (title != null) updates['title'] = title;
    if (description != null) updates['description'] = description;
    if (day != null) updates['day'] = day;
    if (hour != null) updates['hour'] = hour;
    return await db.update('notes', updates, where: 'id = ?', whereArgs: [id]);
  }
}
