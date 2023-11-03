import 'package:dm00ss/share_preference/shared_preference_keys.dart';
import 'package:dm00ss/share_preference/shared_preference_service.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final sharedPreferencesService = SharedPreferencesService.instance;
  ThemeStyle currentAppTheme = themeData.first;

  ThemeProvider init() {
    currentAppTheme = sharedPreferencesService.getObject(
      PrefsKeys.appTheme.name,
      (json) => ThemeStyle.fromJson(json),
      themeData.first,
    );
    return this;
  }

  void setTheme(ThemeStyle theme) {
    currentAppTheme = theme;
    sharedPreferencesService.setObject(PrefsKeys.appTheme.name, theme);
    notifyListeners();
  }
}
