import 'package:database_demo/Model/User.dart';
import 'package:database_demo/DAL/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class UserMethod{

  /// إضافة صف أو عنصر جديد
  static Future<int> addUser(User user) async {

    // هات الداتابيز
    Database myDatabase = await DatabaseHelper.getDb();

    // جهز الصف أو العنصر الجديد
    Map<String, dynamic> userMap = new Map();
    /* the id is autoincrement no need to add*/
    userMap[DatabaseHelper.usernameColumn] = user.username; // ميثود في كلاس يوزر اللي
    userMap[DatabaseHelper.passwordColumn] = user.password; // نفس الكلام
    // جملة الإضافة
    int result = await myDatabase.insert(DatabaseHelper.tableName, userMap);
    return result;
  }

  /// استعراض كل المستخدمين
  static Future<List> getAllUsers() async {
    // هات الداتابيز
    Database myDatabase = await DatabaseHelper.getDb();
    // جملة الاستعراض
    List userData = await myDatabase.rawQuery('SELECT * FROM ${DatabaseHelper.tableName}');
    return userData.toList();
  }

  /// حذف صف أو عنصر
  static Future<int> deleteUser (int id) async {
    // هات الداتابيز
    Database myDatabase = await DatabaseHelper.getDb();
    // جملة الحذف
    int result = await myDatabase.delete(DatabaseHelper.tableName, where: '${DatabaseHelper.idColumn} = $id'); // من غير where هيحذف الجدول كله
    return result; // عاوزه يرجع بعدد السجلات اللي تم حذفها
  }

  /// التعديل في الصف أو العنصر
  static Future<int> editUser (User oldUser) async {
    // هات الداتابيز
    Database myDatabase = await DatabaseHelper.getDb();
    Map<String, dynamic> newUser = new Map();
    // الداتا الجديدة
    newUser [DatabaseHelper.idColumn] = oldUser.id.toString(); // the same id
    newUser [DatabaseHelper.usernameColumn] = 'Ahmed'; // username modification
    newUser [DatabaseHelper.passwordColumn] = '12345'; // password modification
    // جملة التعديل
    int result = await myDatabase.update(DatabaseHelper.tableName, newUser);
    return result;
  }


}















