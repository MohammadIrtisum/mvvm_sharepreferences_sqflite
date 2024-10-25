import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_sharepreferences_sqflite/MVVM/models/student_data_structure.dart';
import 'package:mvvm_sharepreferences_sqflite/MVVM/view%20models/student_data_view_model.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    // Use Get.put() to create the controller and make it accessible in the widget tree
    ManageStudentData manageStudentData = Get.put(ManageStudentData());

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use Obx() to observe changes in the controller
            Obx(() => Center(
              child: Text(
                "Name: ${manageStudentData.studentDataStructure.value.name.value}\nID: ${manageStudentData.studentDataStructure.value.id.value}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: size.width * .031,
                ),
              ),
            )),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: () {
              // Update the student data
              manageStudentData.updateStudentData(name: "Mohammad".obs, id: "21".obs);
            }, child: Text("Update data"))
          ],
        ),
      ),
    );
  }
}

// class StudentDataStructure {
//   final RxString name, id;
//   StudentDataStructure({required this.name, required this.id});
// }

// class ManageStudentData extends GetxController {
//   // Initial data
//   Rx<StudentDataStructure> _studentDataStructure =
//       StudentDataStructure(name: "Irtisum".obs, id: "25".obs).obs;
//
//   Rx<StudentDataStructure> get studentDataStructure => _studentDataStructure;
//
//     updateStudentData({required RxString name, required RxString id}){
//       _studentDataStructure.value = StudentDataStructure(name: name, id: id);
//     }
// }
