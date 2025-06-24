import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('stundenrechner.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE work_times (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        start_time REAL,
        end_time REAL,
        break_time REAL DEFAULT 0.0,         -- NEW COLUMN
        working_time REAL
      )
    ''');
  }

  Future<int> insertWorkTime(
    String date,
    double start,
    double end,
    double breakTime, // NEW PARAMETER
    double workingTime,
  ) async {
    final db = await instance.database;
    return await db.insert('work_times', {
      'date': date,
      'start_time': start,
      'end_time': end,
      'break_time': breakTime, // NEW FIELD
      'working_time': workingTime,
    });
  }

  Future<List<Map<String, dynamic>>> getAllWorkTimes() async {
    final db = await instance.database;
    return await db.query('work_times', orderBy: 'date DESC');
  }

  Future<int> updateWorkTime(Map<String, dynamic> entry) async {
    final db = await instance.database;
    return await db.update(
      'work_times',
      entry,
      where: 'id = ?',
      whereArgs: [entry['id']],
    );
  }

  Future<void> deleteWorkTime(int id) async {
    final db = await database;
    await db.delete('work_times', where: 'id = ?', whereArgs: [id]);
  }

  Future<double> getNettoArbeitszeitByDate(String date) async {
    final db = await instance.database;
    final entries = await db.query(
      'work_times',
      where: 'date = ?',
      whereArgs: [date],
    );

    // Zeitblöcke als Liste von (start, end)
    List<Map<String, double>> blocks = entries.map((entry) {
      return {
        'start': entry['start_time'] as double,
        'end': entry['end_time'] as double,
      };
    }).toList();

    // Sortieren nach Startzeit
    blocks.sort((a, b) => a['start']!.compareTo(b['start']!));

    // Zusammenführen überlappender Blöcke
    List<Map<String, double>> merged = [];
    for (var block in blocks) {
      if (merged.isEmpty) {
        merged.add(block);
      } else {
        var last = merged.last;
        if (block['start']! <= last['end']!) {
          // Wenn sich die Blöcke überschneiden oder aneinanderstoßen
          if (block['end']! > last['end']!) {
            last['end'] = block['end']!;
          }
        } else {
          merged.add(block);
        }
      }
    }

    // Netto-Zeit berechnen
    double nettoZeit = 0.0;
    for (var block in merged) {
      nettoZeit += block['end']! - block['start']!;
    }

    return nettoZeit;
  }
}
