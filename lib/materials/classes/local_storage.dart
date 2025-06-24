import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices{
  static Future<String?> getStringValue(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<void> setStringValue(String key, String value) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }
}