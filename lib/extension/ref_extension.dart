import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/ui/default_pages/default_page/default_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefExtension on WidgetRef {

  void pushPage(PageName pageName) {
    var currentPage = read(pageProvider);
    var pageHistory = read(pageHistoryProvider);

    if(currentPage == pageName) {
      return;
    }

    pageHistory.add(pageName);

    read(pageProvider.notifier).state = pageName;
    read(pageHistoryProvider.notifier).state = pageHistory;
  }

  void popPage() {
    var pageHistory = read(pageHistoryProvider);

    if(pageHistory.length > 1) {
      pageHistory.removeLast();
    } else {
      print('最後一頁了');
    }

    read(pageHistoryProvider.notifier).state = pageHistory;
    read(pageProvider.notifier).state = pageHistory.last;
  }

}