import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_sharepreferences_sqflite/shared_preferences/controller/counter_controller.dart';

class SharedPreferencesExample extends StatelessWidget {
  const SharedPreferencesExample({super.key});

  @override
  Widget build(BuildContext context) {
    //RxInt i = 0.obs;
    CoutnerController counterController = Get.put(CoutnerController());
    return Obx(()=>Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterController.updateCounter();
      },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.plus_one,color: Colors.white,),
      ),
      body: Center(
        child: Text(counterController.i.value.toString(),
            style: TextStyle(
              fontSize: 31,
            )
        ),
      ),
    ));
  }
}
