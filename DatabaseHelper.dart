import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class DatabaseHelper {

  static String databaseName = 'mydb.db'; // For making the path
  // المخزن اللي هخزن فيه الداتابيز اللي هجيبها .. بجيبها من الذاكرة للـ الرام
  static Database _db;

  /// أسماء العماويد .. بستخدمها في الميثود _firstCreate
  static final String tableName = 'userTable'; // table name
  static final String idColumn = 'id';           // id column
  static final String usernameColumn = 'username'; // username column
  static final String passwordColumn = 'password'; // password column

  /// هات الداتابيز في الرام --> في مخزن
  static Future<Database> getDb() async {
    if (_db != null) { // if the database exist
      return _db; // get it
    }
    else { // if the database is not exist
      _db = await openDb(); // create it then open it
      return _db; // get it
    }
  }

  /// Database creation
  static Future<Database> openDb() async {
    Directory dir = await getApplicationDocumentsDirectory(); // Get the project path
    String path = join(dir.path, databaseName); // Make a path for the database
    var userDb = await openDatabase(path, version: 1, onCreate: _firstCreate); // open the database in the variable
    return userDb; // return with the database
  }

  /// Creation Methods --> Creating the table by making columns --> returned to openDb() method
  static void _firstCreate(Database db, int version) async {
    // The statement will be put inside the execution statement
    var tableDeclarationStatement = 'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $usernameColumn TEXT, $passwordColumn TEXT)';
    await db.execute(tableDeclarationStatement); // قولتله اعمللي جدول بالعماويد دي
  }

  // delete and re-create the database
  void restartDb() async {
    Directory dir = await getApplicationDocumentsDirectory(); // Get the project path
    String path = join(dir.path, databaseName); // Make a path for the database
    File f = new File(path);
    if (!f.existsSync()) { // لو موجودة امسحها
      deleteDatabase(path);
      print('Database has been deleted');
    } // هو قال هتروح على ال_firstCreate() أوتوماتيك بس انا مش فاهم إزاي
  }

  /// close the database
  static Future<void> closeDb() async {
    var db = await getDb();
    db.close();
    _db = null;
  }
}



