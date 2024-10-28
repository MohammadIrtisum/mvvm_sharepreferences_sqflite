// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class SqfliteExam extends StatefulWidget {
//   const SqfliteExam({super.key});
//
//   @override
//   State<SqfliteExam> createState() => _SqfliteExamState();
// }
//
// class _SqfliteExamState extends State<SqfliteExam> {
//   late Database database;
//   List<Map<String, dynamic>> _users = [];
//
//   // Initialize database and fetch users
//   init() async {
//     await initializeDatabase();
//     await fetchUsers(); // Fetch existing users after initializing database
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }
//
//   // Initialize the database
//   Future<void> initializeDatabase() async {
//     String path = join(await getDatabasesPath(), 'users.db');
//     database = await openDatabase(
//       path,
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
//         );
//       },
//       version: 1,
//     );
//     print('Database initialized');
//   }
//
//   // Fetch all users from the database
//   Future<void> fetchUsers() async {
//     final List<Map<String, dynamic>> users = await database.query('users');
//     print('Fetched users: $users');
//     setState(() {
//       _users = users;
//     });
//   }
//
//   // Insert a user into the database
//   Future<void> insertUser(String name, int age) async {
//     await database.insert(
//       'users',
//       {'name': name, 'age': age},
//       conflictAlgorithm: ConflictAlgorithm.ignore,
//     );
//     print('User inserted');
//     await fetchUsers(); // Fetch users after inserting a new one
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // TextField to input user's name and insert into the database
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Enter your name',
//                   hintText: 'Type your name...',
//                   border: OutlineInputBorder(),
//                 ),
//                 onSubmitted: (value) {
//                   if (value.isNotEmpty) {
//                     insertUser(value, 25); // Example: Inserting with fixed age 25
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: _users.isNotEmpty
//                     ? ListView.builder(
//                   itemCount: _users.length,
//                   itemBuilder: (context, index) {
//                     final user = _users[index];
//                     return ListTile(
//                       title: Text(user['name']),
//                       subtitle: Text('Age: ${user['age']}'),
//                     );
//                   },
//                 )
//                     : Center(
//                   child: Text('No users found!'), // Show if no users in the list
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
