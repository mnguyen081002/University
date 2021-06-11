import 'package:shared_preferences/shared_preferences.dart';

class SearchSharedPreferences {
  static const _keyHistory = 'history';

  static late SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setHistory(String universityName) async {
    List<String> list = [];

    if (getHistory() != null) list = getHistory()!;

    if (!list.contains(universityName)) list.insert(0, universityName);

    _preferences.setStringList(_keyHistory, list);
  }

  static List<String>? getHistory() => _preferences.getStringList(_keyHistory);

  static removeAllHistory() => _preferences.clear();
}
