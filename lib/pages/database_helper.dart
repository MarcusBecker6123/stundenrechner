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
    double breakTime,      // NEW PARAMETER
    double workingTime,
  ) async {
    final db = await instance.database;
    return await db.insert('work_times', {
      'date': date,
      'start_time': start,
      'end_time': end,
      'break_time': breakTime,   // NEW FIELD
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
    await db.delete(
      'work_times',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
