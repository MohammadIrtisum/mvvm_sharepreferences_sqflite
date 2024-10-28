import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AssignmentDemo extends StatelessWidget {
  const AssignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    late Database database;
    List<Map<String, dynamic>> _users = [];

    // Initialize database and fetch users
    init() async {
      await initializeDatabase();
      await fetchUsers(); // Fetch existing users after initializing database
    }

    @override
    void initState() {
      super.initState();
      init();
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
      print('Database initialized');
    }

    // Fetch all users from the database
    Future<void> fetchUsers() async {
      final List<Map<String, dynamic>> users = await database.query('users');
      print('Fetched users: $users');
      _users = users;
    }

    // Insert a user into the database
    Future<void> insertUser(String name, int age) async {
      await database.insert(
        'users',
        {'name': name, 'age': age},
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      print('User inserted');
      await fetchUsers(); // Fetch users after inserting a new one
    }

    return Scaffold(

    );
  }
}
