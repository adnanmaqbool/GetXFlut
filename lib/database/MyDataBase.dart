import 'package:flutter/widgets.dart';
import 'dart:async';
import '../const/app_const.dart';
import '../model/categories/Category.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class MyDatabase {
  MyDatabase._privateConstructor();

  static final MyDatabase _instance = MyDatabase._privateConstructor();

  // static late Future<Database> _dbInstance;
  static Future<Database>? _dbInstance;

  factory MyDatabase() {
    // _dbInstance = dataBaseCreation();
    return _instance;
  }

  // Public getter for the database instance
  Future<Database> get database async {
    // Initialize database if it’s not already
    _dbInstance ??= dataBaseCreation();
    return _dbInstance!;
  }

// A method that retrieves all the dogs from the dogs table.
  Future<List<Category>> getCategoryList() async {
    // Get a reference to the database.
    final db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, Object?>> maps =
        await db.query(AppConst.categoryTableName);
/*    dynamic maps = await db.query(AppConst.categoryTableName);
    return maps;*/

    // return categoryFromJson(maps); // old way

    return List<Category>.from(
        maps.map((map) => Category.fromJson(map))); // new way
  }

  Future<int> queryRowCount(String tableName) async {
    final db = await database;

    final results = await db.rawQuery('SELECT COUNT(*) FROM $tableName');
    return Sqflite.firstIntValue(results!) ?? 0;
  }

  Future<void> insertList(List<dynamic> catList, String tableName) async {
    // Get a reference to the database.
    final db = await database;

    // categoryToJson
    catList.forEach((element) async {
      await db.insert(
        tableName,
        element.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<void> insertItem(dynamic item, String tableName) async {
    // Get a reference to the database.
    final db = await database;

    // categoryToJson
    await db.insert(
      tableName,
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteRecord(String tableName) async {
    // Get a reference to the database.
    final db = await database;

    return await db.delete(tableName);
  }
}

Future<Database> dataBaseCreation() async {
  sqfliteFfiInit();
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'recipes.db'),
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE ${AppConst.categoryTableName}(Id INTEGER PRIMARY KEY, CategoryName TEXT, CountryId TEXT, RecipeCount TEXT)');
    },
    version: 1,
  );
  //
}
