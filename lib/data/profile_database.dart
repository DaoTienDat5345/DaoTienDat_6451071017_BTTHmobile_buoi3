import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/profile_model.dart';

class ProfileDatabase {
  ProfileDatabase._();

  static final ProfileDatabase instance = ProfileDatabase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _openDatabase('profile.db');
    return _database!;
  }

  Future<Database> _openDatabase(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profile(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        about_me TEXT NOT NULL,
        work_experience TEXT NOT NULL,
        education TEXT NOT NULL,
        skills TEXT NOT NULL,
        projects TEXT NOT NULL,
        certifications TEXT NOT NULL,
        languages TEXT NOT NULL,
        interests TEXT NOT NULL,
        references_text TEXT NOT NULL
      )
    ''');

    await db.insert(
      'profile',
      ProfileData.empty().toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<ProfileData> getProfile() async {
    final db = await database;
    final rows = await db.query(
      'profile',
      where: 'id = ?',
      whereArgs: [1],
      limit: 1,
    );

    if (rows.isNotEmpty) {
      return ProfileData.fromMap(rows.first);
    }

    final empty = ProfileData.empty();
    await saveProfile(empty);
    return empty;
  }

  Future<void> saveProfile(ProfileData profile) async {
    final db = await database;
    await db.insert(
      'profile',
      profile.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

