import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';

class SharedPrefService {
  Future<String?> getData({required String path}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? jsonString = sharedPreferences.getString(path);
    return jsonString;
  }

  Future<void> saveData({
    required String path,
    required String jsonString,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isStored = await sharedPreferences.setString(path, jsonString);
    if (isStored == false) {
      throw CacheException();
    }
  }
}
