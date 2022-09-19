

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {

  Future<String> getShared(String key) async {
    final pref = await SharedPreferences.getInstance();
    final result= await pref.getString(key);
      if(result != null){
        return result;
      }else{
        return "";
      }
  }

  Future<void> saveShared(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString(key, value);
  }

  Future<bool> removeShared( String key) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.remove(key);
    return result;
  }


}