import 'package:calculadoraimcbancooff/Home/models/home_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalData {
  Future<Database> initDatabase() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, 'imc.db');

    return openDatabase(path, version: 1, onCreate: _createDataBase);
  }

  Future<void> _createDataBase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE imc_table (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso REAL,
        altura REAL,
        imc REAL,
        categoria TEXT
      )
    ''');
  }

  Future<int> insertImcEntry(ImcModel entry) async {
    final db = await initDatabase();
    return await db.insert('imc_table', entry.toMap());
  }

  Future<List<ImcModel>> getImcEntries() async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('imc_table');
    return maps.map((map) {
      return ImcModel(
        peso: map['peso'],
        altura: map['altura'],
        imc: map['imc'],
        categoria: map['categoria'],
      );
    }).toList();
  }
}
