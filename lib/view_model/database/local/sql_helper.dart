import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' ;
import 'package:path/path.dart';

class SQLHelper {
  static Database? _database;
   Future<Database?> get database async {
     if(_database == null){
       _database = await sqlInit();
       return _database;
     }
     else {
       return _database;
     }
   }

  sqlInit() async {
    String databasePath = await getDatabasesPath();
    String fullPath = join(databasePath, 'db.db');
    Database database = await openDatabase(fullPath, onCreate: dataBaseCreation);
  }

  dataBaseCreation(Database database, int version) async {
      await database.execute("""
      CREATE TABLE calls(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      phone TEXT,
      doctor TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
       """);
      return database;
  }

  // Get Data
  getData(String sqlGetStatement) async {
     Database? myDatabase = await database;
     var databaseResponse = await myDatabase!.rawQuery(sqlGetStatement);
     return databaseResponse;
  }

  // Insert Data
  insertData(String sqlGetStatement) async {
    Database? myDatabase = await database;
    var databaseResponse = await myDatabase!.rawInsert(sqlGetStatement);
    return databaseResponse;
  }

  // Insert Data
  updateData(String sqlGetStatement) async {
    Database? myDatabase = await database;
    var databaseResponse = await myDatabase!.rawUpdate(sqlGetStatement);
    return databaseResponse;
  }

  // Delete Data
  deleteData(String sqlGetStatement) async {
    Database? myDatabase = await database;
    var databaseResponse = await myDatabase!.rawDelete(sqlGetStatement);
    return databaseResponse;
  }

  //
  // static Future<sql.Database> db() async {
  //   return sql.openDatabase('database.db', version: 1,
  //       onCreate: (sql.Database database, int version) async {
  //     await createTables(database);
  //   });
  // }
  //
  // static Future<int> createItem(String title, String? description) async {
  //   final db = await SQLHelper.db();
  //   final data = {'title': title, 'description': description};
  //   final id = await db.insert(
  //     'calls',
  //     data,
  //     conflictAlgorithm: sql.ConflictAlgorithm.replace,
  //   );
  //   return id;
  // }
  //
  // static Future<List<Map<String, dynamic>>> getItems() async {
  //   final db = await SQLHelper.db();
  //   return db.query('items', orderBy: 'id');
  // }
}
