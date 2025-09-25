import 'package:sqflite/sqflite.dart';

import 'db_manager.dart';

abstract class MasterRepository {
  Future<dynamic> save({required List<dynamic> data, required String tableName}) async {
    Database dbManager = await DbManager().db;
    Batch batch = dbManager.batch();
    for (final item in data) {
      batch.insert(tableName, item.toDatabase());
    }
    return batch.commit();
  }

  Future<void> delete({required String table}) async {
    Database dbManager = await DbManager().db;
    await dbManager.delete(table);
  }

  Future<List<Map<String, dynamic>>> selectAll({required String table}) async {
    Database dbManager = await DbManager().db;
    return await dbManager.query(table);
  }

  Future<List<Map<String, dynamic>>> selectWhere({
    required String table,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    Database dbManager = await DbManager().db;
    return await dbManager.query(table, where: whereClause, whereArgs: whereArgs);
  }

  Future<List<Map<String, dynamic>>> selectOnly({required String table, required List<String> columns}) async {
    Database dbManager = await DbManager().db;
    return await dbManager.query(table, columns: columns);
  }

  Future<List<Map<String, dynamic>>> selectOnlyWhere({
    required String table,
    required List<String> columns,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    Database dbManager = await DbManager().db;
    return await dbManager.query(table, columns: columns, where: whereClause, whereArgs: whereArgs);
  }

  Future<int> update({
    required String table,
    required String whereClause,
    required List<dynamic> whereArgs,
    required Map<String, dynamic> data,
  }) async {
    Database dbManager = await DbManager().db;
    return await dbManager.update(table, data, where: whereClause, whereArgs: whereArgs);
  }

  Future<int> deleteWhere({
    required String table,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    Database dbManager = await DbManager().db;
    return await dbManager.delete(table, where: whereClause, whereArgs: whereArgs);
  }
}
