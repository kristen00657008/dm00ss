import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/ui/default_pages/default_page/default_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as pro;

import 'widget/custom_expansion_tile.dart';
import 'widget/custom_list_tile.dart';

class DrawerView extends ConsumerStatefulWidget {
  const DrawerView({super.key});

  @override
  ConsumerState<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends ConsumerState<DrawerView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = pro.Provider.of<ScreenSize>(context);
    return pro.Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Container(
        width: screenSize.screenWidth * 0.8,
        decoration: BoxDecoration(
          color: themeProvider.currentAppTheme.backgroundColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              buildTopBar(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ExpansionTile(
                      shape: Border(),
                      title: Text('使用者管理'),
                      children: const [
                        CustomListTile(
                          title: '使用者基本資料維護',
                        ),
                        CustomListTile(
                          title: '公司基本資料維護',
                        ),
                        CustomListTile(
                          title: '使用者權限管理',
                        ),
                        CustomListTile(
                          title: '使用者跨倉設定',
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('會員管理'),
                      children: [
                        CustomListTile(
                          title: '會員查詢',
                          onTap: () {
                            context.pop();
                            ref.read(pageProvider.notifier).state = PageName.MemberQueryPage;
                          },
                        ),
                        CustomExpansionTile(
                          title: '會員基本資料',
                          children: const [
                            CustomListTile(
                              title: '常用備註設定',
                            ),
                          ],
                        ),
                        CustomListTile(
                          title: '即時組織查詢',
                        ),
                        CustomExpansionTile(
                          title: '業績組織查詢',
                          children: const [
                            CustomListTile(
                              title: '會員階級設定',
                            ),
                          ],
                        ),
                        CustomListTile(
                          title: '繼承移轉',
                        ),
                        CustomListTile(
                          title: '會員積分移轉',
                        ),
                        CustomListTile(
                          title: '上線變更',
                        ),
                        CustomListTile(
                          title: '入會方式變更',
                        ),
                        CustomListTile(
                          title: '會員證號異動紀錄',
                        ),
                        CustomListTile(
                          title: '檢查組織',
                        ),
                        CustomListTile(
                          title: '會員資格調整',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildTopBar() {
    return Container(
      height: kToolbarHeight,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              context.pop();
              ref.read(pageProvider.notifier).state = PageName.FastNewsPage;
            },
            child: Text(
              "直銷管理系統",
            ),
          ),
          SizedBox(width: 48),
        ],
      ),
    );
  }
}
