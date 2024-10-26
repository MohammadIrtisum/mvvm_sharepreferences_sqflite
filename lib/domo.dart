import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteExample extends StatefulWidget {
  const SqfliteExample({super.key});

  @override
  State<SqfliteExample> createState() => _SqfliteExampleState();
}

class _SqfliteExampleState extends State<SqfliteExample> {
  late Database database;
  List<Map<String, dynamic>> _users = [];

  init() async {
    await _initializeDatabase();
    await _fetchUsers();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> _initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'user.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> _fetchUsers() async {
    final List<Map<String, dynamic>> users = await database.query('users');
    setState(() {
      _users = users;
    });
  }

  Future<void> _insertUser(String name, int age) async {
    await database.insert(
      'users',
      {'name': name, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _fetchUsers(); // Refresh the user list after insertion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Enter name"),
              onSubmitted: (value) {
                _insertUser(value, 25); // Adding user with a static age of 25
              },
            ),
            const SizedBox(height: 20),
            _users.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text('Name: ${user['name'] ?? ""}'),
                      subtitle: Text('Age: ${user['age'] ?? ""}'),
                    );
                  }),
            )
                : const SizedBox(), // Display nothing if no users found
          ],
        ),
      ),
    );
  }
}
