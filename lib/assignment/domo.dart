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
    await initializeDatabase();
    await fetchUsers();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> initializeDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), 'users.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
        }, version: 2);
  }

  Future<void> fetchUsers() async {
    final List<Map<String, dynamic>> users = await database.query('users');
    setState(() {
      _users = users;
    });
  }

  Future<void> insertUser(String name, int age) async {
    await database.insert('users', {'name': name, 'age': age},
        conflictAlgorithm: ConflictAlgorithm.replace);
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "enter name"),
                onSubmitted: (value) {
                  //insert this data to database...
                  insertUser(value, 25);
                },
              ),
              const SizedBox(
                height: 21,
              ),
              _users.isEmpty
                  ? const SizedBox()
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(dynamic d in _users)
                    Text("${d['name']}\n${d['age'].toString()}\n",
                      textAlign: TextAlign.start,
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}