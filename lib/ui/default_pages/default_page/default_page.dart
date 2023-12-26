import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/ui/fast_news/fast_news_page.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pro;

import 'drawer_view.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return WillPopScope(
          onWillPop: () {
            ref.read(pageProvider.notifier).popPage();
            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawerEnableOpenDragGesture: false,
            body: getPage(ref.watch(pageProvider)),
          ),
        );
      },
    );
  }

  Widget getPage(PageName pageName) {
    switch (pageName) {
      case PageName.FastNewsPage:
        return FastNewsPage();
      case PageName.MemberQueryPage:
        return MemberQueryPage();
      case PageName.MemberInfoPage:
        return MemberInfoPage();
      default:
        return Text("Error Page");
    }
  }
}
