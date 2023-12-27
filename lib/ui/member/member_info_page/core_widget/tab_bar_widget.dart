import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

class TabBarWidget extends ConsumerStatefulWidget {
  final ThemeStyle themeStyle;
  final MemberInfoModel model;
  const TabBarWidget({super.key, required this.themeStyle, required this.model,});

  @override
  ConsumerState<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends ConsumerState<TabBarWidget>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TabBar(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        isScrollable: true,
        labelColor: widget.themeStyle.backgroundColor,
        indicator: const UnderlineTabIndicator(),
        controller: widget.model.tabController,
        tabs:  MemberInfoTabs.values.map((e) {
          return Tab(
            text: e.title,
          );
        }).toList(),
      ),
    );
  }
}
