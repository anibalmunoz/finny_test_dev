import 'package:sqflite/sqflite.dart';

class TableManager {
  TableManager._();

  static final TableManager shared = TableManager._();

  Future<void> favorites(Database db) async {
    await db.execute("DROP TABLE IF EXISTS favorites");
    await db.execute('''CREATE TABLE favorites (
        uid TEXT PRIMARY KEY,
        summary TEXT,
        products TEXT,        
        type TEXT,             
        title TEXT,
        durationInMinutes INTEGER,
        rating TEXT,           
        popularity REAL,
        iconUrl TEXT,
        socialImageUrl TEXT,
        lastModified TEXT,      
        url TEXT,
        firstUnitUrl TEXT,
        units TEXT,            
        numberOfChildren INTEGER,
        subjects TEXT
      )''');
  }
}
