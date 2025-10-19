import 'package:meals/features/home_screen/data/models/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imageUrl TEXT,
      name TEXT,
      description TEXT,
      rate REAL,
      time TEXT
      )
      ''');
  }

  Future<int> insertMeal(Meal meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert('meals', mealMap);
  }

  Future<List<Meal>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealsJson = await db.query('meals');
    List<Meal> meals = mealsJson
        .map((mealJson) => Meal.fromMap(mealJson))
        .toList();
    return meals;
  }
}
