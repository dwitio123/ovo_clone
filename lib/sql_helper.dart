import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cats(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      age INTEGER
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kitty_database.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      }
    );
  }

  static Future<int> insertCat(String name, int age) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'age': age};
    final id = await db.insert('cats', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('cats', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('cats', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String name, int age) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'age': age
    };

    final result = await db.update('cats', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cats", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Kesalahan saat ingin menghapus data: $err");
    }
  }
}