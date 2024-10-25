import 'package:get/get.dart';
import 'package:mvvm_sharepreferences_sqflite/MVVM/models/student_data_structure.dart';

class ManageStudentData extends GetxController {
  // Initial data
  Rx<StudentDataStructure> _studentDataStructure =
      StudentDataStructure(name: "Irtisum".obs, id: "25".obs).obs;

  Rx<StudentDataStructure> get studentDataStructure => _studentDataStructure;

  updateStudentData({required RxString name, required RxString id}){
    _studentDataStructure.value = StudentDataStructure(name: name, id: id);
  }
}