import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_data_structure.dart';


class UserController extends GetxController {
  late Database database;
  var users = <User>[].obs; // Observable list of User models

  @override
  void onInit() {
    super.onInit();
    initializeDatabase();
  }

  // Initialize the database
  Future<void> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    database = await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    fetchUsers(); // Fetch users after initializing database
  }

  // Fetch all users from the database
  Future<void> fetchUsers() async {
    final List<Map<String, dynamic>> userList = await database.query('users');
    users.assignAll(userList.map((e) => User.fromMap(e)).toList()); // Map to User model

  }

  // Insert a user into the database
  Future<void> insertUser(User user) async {
    await database.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    fetchUsers(); // Refresh users after insertion
  }
}
