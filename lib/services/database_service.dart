import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('farmers.db');
    return _database!;
  }

  _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE farmers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT,
        dob TEXT,
        gender TEXT,
        landArea REAL,
        latitude REAL,
        longitude REAL,
        // Define other fields
      )
    ''');
    // Create other tables if needed
  }

  Future<int> insertFarmer(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('farmers', row);
  }

// Add other CRUD methods
}
