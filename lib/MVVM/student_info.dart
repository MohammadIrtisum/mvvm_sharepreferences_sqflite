import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                "Name: ${manageStudentData.studentDataStructure.value.name.value}\nAge: ${manageStudentData.studentDataStructure.value.id.value}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: size.width * .031,
                ),
              ),
            )),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: () {
              // Update the student data
              manageStudentData.updateStudentData(name: "Mohammad", id: "21");
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

class ManageStudentData extends GetxController {
  // Initial data
  Rx<StudentDataStructure> _studentDataStructure =
      StudentDataStructure(name: "Irtisum".obs, id: "25".obs).obs;

  Rx<StudentDataStructure> get studentDataStructure => _studentDataStructure;

  // Method to update student data
  void updateStudentData({required String name, required String id}) {
    _studentDataStructure.update((student) {
      student?.name.value = name;
      student?.id.value = id;
    });
  }
}
// class ManageStudentData extends GetxController {
//   // Initial data
//   Rx<StudentDataStructure> _studentDataStructure =
//       StudentDataStructure(name: "Irtisum".obs, id: "25".obs).obs;
//
//   Rx<StudentDataStructure> get studentDataStructure => _studentDataStructure;
//
//   // Method to update student data
//   updateStudentData({required String name, required String id}) {
//     _studentDataStructure.value = StudentDataStructure(name: name.obs, id: id.obs);
//   }
// }