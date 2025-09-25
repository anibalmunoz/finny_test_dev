import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/repositories/master_repository/master_repository.dart';
import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';

class FavoritesRepository extends MasterRepository {
  FavoritesRepository._();
  static final FavoritesRepository shared = FavoritesRepository._();

  final String _favoritesTable = "favorites";

  Future<void> saveAll(List<Module> data) async {
    try {
      await super.save(data: data, tableName: _favoritesTable);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<List<Module>> getAll() async {
    try {
      final data = await super.selectAll(table: _favoritesTable);
      if (data.isEmpty) return [];
      return ModelUtils.fromDbList(data, Module.fromDatabase);
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }

  Future<void> deleteAll() async => super.delete(table: _favoritesTable);

  Future<bool> exists(String uid) async {
    try {
      final result = await super.selectWhere(table: _favoritesTable, whereClause: 'uid = ?', whereArgs: [uid]);
      return result.isNotEmpty;
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }

  Future<void> deleteByUid(String uid) async {
    try {
      await super.deleteWhere(table: _favoritesTable, whereClause: "uid = ?", whereArgs: [uid]);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
