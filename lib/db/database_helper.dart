import 'dart:io';

import 'package:crud_javier/models/car.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/cars.db';

    var carsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return carsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE Car (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  nombre TEXT,
                  fecha INTEGER,
                  km INTEGER,
                  tipo TEXT,
                  combustible TEXT,
                  averia TEXT,
                  seguro TEXT,
                  equipamiento TEXT,
                  concepto TEXT,
                  cantidad INTEGER)
    ''');
  }

  Future<int> insertCar(Car car) async {
    Database db = await instance.database;
    int result = await db.insert('Car', car.toMap());
    return result;
  }

  Future<List<Car>> getAllCars() async {
    List<Car> cars = [];

    Database db = await instance.database;

    List<Map<String, dynamic>> listMap = await db.query('Car');

    for (var carMap in listMap) {
      Car car = Car.fromMap(carMap);
      cars.add(car);
    }

    return cars;
  }

  Future<int> deleteCar(int id) async {
    Database db = await instance.database;
    int result = await db.delete('Car', where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<int> updateCar(Car car) async {
    Database db = await instance.database;
    int result = await db.update('Car', car.toMap(), where: 'id=?', whereArgs: [car.id]);
    return result;
  }
}
