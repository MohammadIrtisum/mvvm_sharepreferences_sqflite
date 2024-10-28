import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_sharepreferences_sqflite/MVVM/views/student_info.dart';
import 'package:mvvm_sharepreferences_sqflite/assignment/Assignment_MVVM/view/user_info.dart';
import 'package:mvvm_sharepreferences_sqflite/assignment/domo.dart';
import 'package:mvvm_sharepreferences_sqflite/shared_preferences/shared_preferences_example.dart';
import 'package:mvvm_sharepreferences_sqflite/sqflite/sqflite_exam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SqfliteEx()
    );
  }
}

