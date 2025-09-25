import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'table_manager.dart';

class DbManager {
  static final DbManager _instance = DbManager.internal();

  factory DbManager() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  DbManager.internal();

  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'seguni.db');
    final compileInfo = await PackageInfo.fromPlatform();
    final int dbVersion = int.parse(compileInfo.buildNumber);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, _) async => await _handleTables(db),
      onUpgrade: (db, _, _) async => await _handleTables(db),
    );
  }

  Future<void> _handleTables(Database db) async {
    await TableManager.shared.favorites(db);
  }
}
