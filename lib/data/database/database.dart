import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../presentation/sign_up_screen/models/users.dart';

class DatabaseHelper {
  late Database _db;

  Future<void> open() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<void> insertUser(User user) async {
    await _db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<User>> getAllUsers() async {
    final List<Map<String, dynamic>> users = await _db.query('users');
    return users.map((user) => User.fromMap(user)).toList();
  }
  Future<User?> getUser(String email, String password) async {
    List<Map<String, dynamic>> maps = await _db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }
  Future<User?> getUserByEmail(String email) async {
    final db = await _db;
    var result = await db.query(
      'users', // Use the correct table name here
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }
  // Future<void> saveUserName(String userName) async {
  //   await _db.insert('users', {'name': userName},
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }
  //
  //
  // Future<String?> getUserName() async {
  //   final db = await _db.database;
  //   final List<Map<String, dynamic>> result = await db.query('users');
  //   if (result.isNotEmpty) {
  //     return result.first['name'] ?? ''; // Return an empty string if the user name is null
  //   }
  //   return '';
  // }
  final box = GetStorage();

  Future<void> saveUserName(String userName) async {
    await box.write('userName', userName);
    print("hello User ===0");
    print(userName);
  }

  Future<String?> getUserName() async {

     var readed = box.read('userName');
     print("read ==== ");
     print(readed);
     return readed;

  }
}
