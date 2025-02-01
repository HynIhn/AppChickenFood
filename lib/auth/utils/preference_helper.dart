import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefsHelper {
  static const _auth = 'auth';

  static Future<void> saveAuth(String token, int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_auth, [token, userId.toString()]);
  }

  static Future<List<String>?> getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_auth);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getStringList(_auth);
    return auth?.isNotEmpty == true ? auth![0] : null;
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getStringList(_auth);
    return auth?.isNotEmpty == true ? int.parse(auth![2]) : null;
  }

  static Future<void> clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_auth);
  }
}
