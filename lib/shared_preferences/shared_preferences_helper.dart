import 'package:shared_preferences/shared_preferences.dart';

// flutter pub add shared_preferences

class SharedPreferencesHelper{
  containKey(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }

  saveString( String key,value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }
  Future<String> getString( String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key)!;
  }
}

