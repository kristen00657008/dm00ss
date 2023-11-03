import 'dart:convert';

import 'package:dm00ss/style/theme_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return instance;
  }

  SharedPreferencesService._internal();

  late SharedPreferences _preferences;

  Future<void> init() async {
    // print("Shared init");
    _preferences = await SharedPreferences.getInstance();
  }

  // 存储数据
  Future<void> setData(String key, dynamic value) async {
    if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    }
  }

  // 获取数据
  dynamic getData<T>(String key, dynamic defaultValue) {
    if (defaultValue is int) {
      return _preferences.getInt(key) ?? defaultValue;
    } else if (defaultValue is double) {
      return _preferences.getDouble(key) ?? defaultValue;
    } else if (defaultValue is String) {
      return _preferences.getString(key) ?? defaultValue;
    } else if (defaultValue is bool) {
      return _preferences.getBool(key) ?? defaultValue;
    } else if (defaultValue is List<String>) {
      return _preferences.getStringList(key) ?? defaultValue;
    } else {
      return _preferences.get(key) ?? defaultValue;
    }
  }

  // 存储对象
  Future<void> setObject(String key, dynamic object) async {
    String jsonString = "";
    if (object is ThemeStyle) {
      ThemeStyle theme = object;
      jsonString = jsonEncode(theme.toJson());
    }

    await _preferences.setString(key, jsonString);
  }

  // 获取对象
  T getObject<T>(String key, T Function(Map<String, dynamic>) fromJson,
      dynamic defaultValue) {
    final jsonString = _preferences.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    } else {
      setObject(key, defaultValue);
      return defaultValue;
    }
  }

  // 删除数据
  Future<void> removeData(String key) async {
    await _preferences.remove(key);
  }
}
