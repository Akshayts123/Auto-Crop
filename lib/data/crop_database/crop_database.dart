import 'package:auto_crop/core/app_export.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../presentation/add_crop_screen/controller/add_crop_controller.dart';

class DatabaseHelpercrop {
  DatabaseHelpercrop._privateConstructor();
  static final DatabaseHelpercrop instance = DatabaseHelpercrop._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'crop_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE crop(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      detail TEXT,
      month TEXT,
      soil TEXT,
      weather TEXT,
      image BLOB
    )
  ''');
  }
  // final AddCropController addCropController = Get.put(AddCropController());
  Future<List<Map<String, dynamic>>> getCropByConditions(String weather, String soil, String month) async {
    try {
      final db = await instance.database;

      // Use your query to fetch crops based on conditions
      final List<Map<String, dynamic>> crops = await db.rawQuery(
        'SELECT * FROM crop WHERE weather = ? AND soil = ? AND month = ?',
        [weather, soil, month],
      );

      // Debugging print
      print('Crops fetched by conditions: $crops');
      // addCropController.cropList.assignAll(crops);
      return crops;
    } catch (e) {
      // Handle any exceptions that may occur during the database query
      print('Error during getCropByConditions: $e');
      return [];
    }
  }

  Future<int> insertCrop(Map<String, dynamic> medicineData) async {
    Database db = await instance.database;
    return await db.insert('crop', medicineData);
  }
  Future<List<Map<String, dynamic>>> getAllCrop() async {
    Database db = await instance.database;
    return await db.query('crop');
  }
  Future<int> updateCrop(int id, Map<String, dynamic> updatedData) async {
    Database db = await instance.database;
    return await db.update(
      'crop',
      updatedData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<int> deleteCrop(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'crop',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<Map<String, dynamic>?> getCrop(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'crop',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
