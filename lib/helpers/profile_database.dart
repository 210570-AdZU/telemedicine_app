import 'package:layout_design/controllers/profile_controller.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileDatabase {
  static final ProfileDatabase _instance = ProfileDatabase._internal();

  factory ProfileDatabase() {
    return _instance;
  }

  ProfileDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

Future<Database> _initDatabase() async {
  String path = join(await getDatabasesPath(), 'profile_database.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
}

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE profiles(id INTEGER PRIMARY KEY AUTOINCREMENT, fName TEXT, mName TEXT, lName TEXT, extensionName TEXT, email TEXT, hospital TEXT, specialization TEXT, password TEXT)',
    );
  }

  Future<int> insertProfile(Map<String, dynamic> profile) async {
    try {
      Database db = await database;
      print('Inserting profile: $profile');
      return await db.insert('profiles', profile);
    } catch (e) {
      print("Error inserting profile: $e");
      return -1; // Indicate failure
    }
  }
    Future<int> updateProfile(Map<String, dynamic> profile) async {
    try {
      Database db = await database;
      return await db.update('profiles', profile, where: 'id = ?', whereArgs: [profile['id']]);
    } catch (e) {
      print("Error updating profile: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getProfiles() async {
    Database db = await database;
    return await db.query('profiles');
  }

  Future<void> deleteProfile(int id) async {
    Database db = await database;
    await db.delete('profiles', where: 'id = ?', whereArgs: [id]);
  }
}