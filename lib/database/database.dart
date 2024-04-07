
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'user_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, phoneNumber TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }
  Future<User?> getUserByEmail(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<void> editUserDetailsByMobile(String mobile, String newName, String newEmail) async {
    final db = await database;
    await db.update(
      'users',
      {'name': newName, 'email': newEmail},
      where: 'phoneNumber = ?',
      whereArgs: [mobile],
    );
  }
}
