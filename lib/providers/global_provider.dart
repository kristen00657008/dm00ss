import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/share_preference/shared_preference_keys.dart';
import 'package:dm00ss/share_preference/shared_preference_service.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class PageProviderNotifier extends StateNotifier<PageName> {
  final PageHistoryNotifier pageHistoryProviderNotifier;
  PageProviderNotifier(this.pageHistoryProviderNotifier) : super(PageName.FastNewsPage);

  void pushPage(PageName pageName) {
    if(state == pageName) {
      return;
    }
    state = pageName;

    pageHistoryProviderNotifier.addPage(pageName);
  }

  void popPage() {
    List<PageName> pageHistory = pageHistoryProviderNotifier.state;
    if(pageHistory.length > 1) {
      pageHistory.removeLast();
      pageHistoryProviderNotifier.state = pageHistory;
    } else {
      print('最後一頁了');
    }
    state = pageHistoryProviderNotifier.state.last;

  }
}

final pageProvider = StateNotifierProvider<PageProviderNotifier, PageName>((ref) {
  return PageProviderNotifier(ref.watch(pageHistoryProvider.notifier));
});


class PageHistoryNotifier extends StateNotifier<List<PageName>> {
  PageHistoryNotifier() : super([PageName.FastNewsPage]);

  void addPage(PageName pageName) {
    state.add(pageName);
  }
}

final pageHistoryProvider = StateNotifierProvider<PageHistoryNotifier, List<PageName>>((ref) {
  return PageHistoryNotifier();
});