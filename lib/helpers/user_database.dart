import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static final UserDatabase _instance = UserDatabase._internal();

  factory UserDatabase() {
    return _instance;
  }

  UserDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

Future<Database> _initDatabase() async {
  String path = join(await getDatabasesPath(), 'user_database.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
}

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, fName TEXT, mName TEXT, lName TEXT, extensionName TEXT, email TEXT, password TEXT)',
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    try {
      Database db = await database;
      print('Inserting user: $user');
      return await db.insert('users', user);
    } catch (e) {
      print("Error inserting user: $e");
      return -1; // Indicate failure
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('users');
  }
}