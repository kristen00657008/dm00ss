import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/share_preference/shared_preference_keys.dart';
import 'package:dm00ss/share_preference/shared_preference_service.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateProvider<PageName>((ref) => PageName.FastNewsPage);

final pageHistoryProvider = StateProvider<List<PageName>>((ref) => [PageName.FastNewsPage]);

final themeProvider = StateProvider<ThemeStyle>((ref) {
  ThemeStyle currentAppTheme = themeData.first;
  currentAppTheme = SharedPreferencesService.instance.getObject(
    PrefsKeys.appTheme.name,
        (json) => ThemeStyle.fromJson(json),
    themeData.first,
  );
  return currentAppTheme;
});

void updateTheme(WidgetRef ref, ThemeStyle theme) {
  ref.read(themeProvider.notifier).state = theme;
  SharedPreferencesService.instance.setObject(PrefsKeys.appTheme.name, theme);
}