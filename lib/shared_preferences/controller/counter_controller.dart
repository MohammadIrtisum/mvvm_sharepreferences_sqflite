import 'package:get/get.dart';
import 'package:mvvm_sharepreferences_sqflite/shared_preferences/shared_preferences_example.dart';
import 'package:mvvm_sharepreferences_sqflite/shared_preferences/shared_preferences_helper.dart';

class CoutnerController extends GetxController{
  RxInt i = 0.obs;
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();


  @override
  Future<void> onInit() async {
    super.onInit();
    if(await sharedPreferencesHelper.containKey("counter")){
      i.value = int.parse(await sharedPreferencesHelper.getString("counter"));
    }
  }

  updateCounter(){
    i.value = i.value+1;
    sharedPreferencesHelper.saveString("counter", i.value.toString());
  }
}