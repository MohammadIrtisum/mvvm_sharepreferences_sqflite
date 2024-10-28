import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_data_structure.dart';
import '../view models/user_data_view_model.dart';

class SqfliteEx extends StatelessWidget {
  SqfliteEx({super.key});

  final UserController userController = Get.put(UserController()); // Injecting the controller

  @override
  Widget build(BuildContext context) {
    String nameInput = ''; // Temporary variable to hold input value

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: SafeArea(
          child: Column(
            children: [
              // TextField to input user's name and insert into the database
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'Type your name...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  nameInput = value; // Store input name
                },
                onSubmitted: (value) {
                  if (nameInput.isNotEmpty) {
                    // Insert a new user with a fixed age of 25
                    userController.insertUser(User(name: nameInput, age: 25));
                    nameInput = ''; // Reset input field
                  }
                },
              ),
              const SizedBox(height: 20),
              // Show user list
              Expanded(
                child: Obx(() {
                  return userController.users.isNotEmpty
                      ? ListView.builder(
                    itemCount: userController.users.length,
                    itemBuilder: (context, index) {
                      final user = userController.users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text('Age: ${user.age}'),
                      );
                    },
                  )
                      : Center(
                    child: Text('No users found!'),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
