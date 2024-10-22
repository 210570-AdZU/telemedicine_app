// lib/controllers/profile_database.dart
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
      // Consider adding onUpgrade for schema migrations in future versions
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE profiles('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'fName TEXT, '
      'mName TEXT, '
      'lName TEXT, '
      'extensionName TEXT, '
      'email TEXT, '
      'password TEXT, '
      'hospitalId INTEGER, '
      'specializationId INTEGER, '
      'FOREIGN KEY (hospitalId) REFERENCES hospitals(id), '
      'FOREIGN KEY (specializationId) REFERENCES specializations(id))',
    );
    await db.execute(
      'CREATE TABLE hospitals('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT)',
    );
    await db.execute(
      'CREATE TABLE specializations('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'description TEXT)',
    );
    await db.execute(
      '''CREATE TABLE patients(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          firstName TEXT,
          middleName TEXT,
          lastName TEXT,
          contactNumber TEXT,
          placeOfWork TEXT,
          address TEXT,
          sex TEXT,
          birthday DATE,
          civilStatus TEXT,
          birthplace TEXT,
          ethnicity TEXT,
          language TEXT,
          hospitalId INTEGER,
          FOREIGN KEY (hospitalId) REFERENCES hospitals(id)
      )''',
    );
    await db.execute(
      '''CREATE TABLE cases(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          temperature INTEGER,
          respiratory INTEGER,
          heart INTEGER,
          blood INTEGER,
          oxygen INTEGER,
          weight INTEGER,
          height INTEGER,
          cc TEXT,
          hpi TEXT,
          pmh TEXT,
          pe TEXT,
          wi TEXT,
          imd TEXT,
          reason TEXT,
          hospitalId INTEGER,
          patientId INTEGER,
          FOREIGN KEY (hospitalId) REFERENCES hospitals(id),
          FOREIGN KEY (patientId) REFERENCES patients(id)
      )''',
    );
    await _insertInitialHospitals(db);
    await _insertInitialSpecializations(db);
    await _insertInitialPatients(db);
  }

  Future<void> _insertInitialHospitals(Database db) async {
    await db.insert('hospitals', {'name': 'Brent Hospital and Colleges Inc.'});
    await db.insert('hospitals', {'name': 'West Metro Medical Center'});
    await db.insert('hospitals', {'name': 'Zamboanga City Medical Center (ZCMC)'});
    await db.insert('hospitals', {'name': 'Zamboanga Peninsula Medical Center (ZamPen)'});
  }

  Future<void> _insertInitialSpecializations(Database db) async {
    await db.insert('specializations',
    {'name': 'Anesthesiology (ANES)',
    'description': 'focused on the relief of pain in the perioperative period (i.e. before, during or after a surgical procedure)'});
    await db.insert('specializations',
    {'name': 'Dermatology (DERM)',
    'description': 'branch of medicine dealing with the skin'});
    await db.insert('specializations',
    {'name': 'Obstetrics and Gynecology (OB/GYN)',
    'description': 'specialization in female healthcare'});
    await db.insert('specializations',
    {'name': 'Pediatrics (PEDS)',
    'description': 'specialization in the healthcare of children'});
    await db.insert('specializations',
    {'name': 'Psychiatry (PSY)',
    'description': 'specialization in mental health'});
  }

  Future<void> _insertInitialPatients(Database db) async {
    await db.insert('patients',
    {'firstName': 'Justin',
    'middleName': 'Khuann',
    'lastName': 'Torres',
    'contactNumber': '0947562819',
    'placeOfWork': 'Someplace',
    'address': 'Somewhere',
    'sex': 'Male',
    'birthday': '1978-12-09',
    'civilStatus': 'Single',
    'birthplace': 'Zamboanga City',
    'ethnicity': 'Zamboangueno',
    'language': 'Cebuano'});
    await db.insert('patients',
    {'firstName': 'Lovelygirl',
    'middleName': 'Angelina',
    'lastName': 'Balawon',
    'contactNumber': '0908141208',
    'placeOfWork': 'Someplace',
    'address': 'Somewhere',
    'sex': 'Female',
    'birthday': '1998-02-17',
    'civilStatus': 'Married',
    'birthplace': 'Zamboanga City',
    'ethnicity': 'Zamboangueno',
    'language': 'Chavacano'});
    await db.insert('patients',
    {'firstName': 'Khaey Roy',
    'middleName': 'Chiong',
    'lastName': 'Reyez',
    'contactNumber': '0928163028',
    'placeOfWork': 'Someplace',
    'address': 'Somewhere',
    'sex': 'Male',
    'birthday': '2011-04-07',
    'civilStatus': 'Single',
    'birthplace': 'Zamboanga City',
    'ethnicity': 'Zamboangueno',
    'language': 'Chavacano',});
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

  Future<int> insertCase(Map<String, dynamic> caseR) async {
    try {
      Database db = await database;
      print('Inserting case: $caseR');
      return await db.insert('cases', caseR);
    } catch (e) {
      print("Error inserting profile: $e");
      return -1; // Indicate failure
    }
  }

  Future<int> updateCase(Map<String, dynamic> caseR) async {
    try {
      Database db = await database;
      return await db.update('cases', caseR, where: 'id = ?', whereArgs: [caseR['id']]);
    } catch (e) {
      print("Error updating case: $e");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getCases() async {
    Database db = await database;
    return await db.query('cases');
  }

  Future<void> deleteCase(int id) async {
    Database db = await database;
    await db.delete('cases', where: 'id = ?', whereArgs: [id]);
  }
}