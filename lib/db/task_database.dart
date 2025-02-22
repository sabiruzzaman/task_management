import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management/models/task.dart';

class TaskDatabase {
  static final TaskDatabase _taskDatabase = TaskDatabase._internal();

  factory TaskDatabase() => _taskDatabase;

  TaskDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tasks_management.db');

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        date TEXT,
        startTime TEXT,
        endTime TEXT,
        description TEXT,
        category TEXT,
        isDone INTEGER
      )
    ''');
  }

  Future<void> insertTask(Task task) async {
    final db = await _taskDatabase.database;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Task>> getTasks() async {
    final db = await _taskDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
  }
}
