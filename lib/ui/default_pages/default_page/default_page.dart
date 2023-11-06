import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/fast_news/fast_news_page.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as pro;

import 'drawer_view.dart';

final pageProvider = StateProvider<PageName>((ref) => PageName.FastNewsPage);

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return pro.Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.read<ThemeProvider>().currentAppTheme.scaffoldColor2,
      ));
      return Container(
        decoration: BoxDecoration(
          color: themeProvider.currentAppTheme.scaffoldColor1,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              themeProvider.currentAppTheme.scaffoldColor1,
              themeProvider.currentAppTheme.scaffoldColor2,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.read<ScreenSize>().screenHeight * 0.5,
                color: themeProvider.currentAppTheme.backgroundColor,
              ),
            ),
            Consumer(builder: (context, ref, _) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                drawerEnableOpenDragGesture: false,
                drawer: DrawerView(),
                appBar: AppBar(
                  title: Text(getPageTitle(ref.watch(pageProvider))),
                  centerTitle: true,
                  actions: [buildMenu()],
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    systemNavigationBarColor: context
                        .read<ThemeProvider>()
                        .currentAppTheme
                        .backgroundColor,
                  ),
                ),
                body: getPage(ref.watch(pageProvider)),
              );
            }),
          ],
        ),
      );
    });
  }

  Widget buildMenu() {
    return PopupMenuButton(
      icon: Icon(Icons.adaptive.more, color: Colors.white),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Text('版型設定'),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showSettingDialog();
            });
          },
        ),
        const PopupMenuItem(
          child: Text('密碼修改'),
        ),
        PopupMenuItem(
          child: Text('登出'),
          onTap: () {
            context.pushReplacement('/');
          },
        ),
      ],
    );
  }

  void showSettingDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            width: context.read<ScreenSize>().screenWidth * 0.8,
            height: context.read<ScreenSize>().screenWidth * 0.8,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildColorGroup(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildColorGroup() {
    final themeProvider =
        pro.Provider.of<ThemeProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pro.Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return Container(
            height: 50,
            width: context.read<ScreenSize>().screenWidth * 0.35,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: themeProvider.currentAppTheme.secondary,
            child: Center(child: Text("整體色系")),
          );
        }),
        Container(
          height: 50,
          color: Theme.of(context).dividerColor,
          width: context.read<ScreenSize>().screenWidth * 0.35,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<ThemeStyle>(
              value: themeProvider.currentAppTheme,
              items: themeData.map((ThemeStyle value) {
                return DropdownMenuItem<ThemeStyle>(
                  value: value,
                  child: Text(
                    value.name,
                    style: TextStyle(color: value.primary),
                  ),
                );
              }).toList(),
              onChanged: (ThemeStyle? value) {
                themeProvider.setTheme(value ?? themeData.first);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget getPage(PageName pageName) {
    switch (pageName) {
      case PageName.FastNewsPage:
        return FastNewsPage();
      case PageName.MemberQueryPage:
        return MemberQueryPage();
      default:
        return Text("Error Page");
    }
  }

  String getPageTitle(PageName pageName) {
    switch (pageName) {
      case PageName.FastNewsPage:
        return "最新消息";
      case PageName.MemberQueryPage:
        return "會員查詢";
      default:
        return "錯誤標題";
    }
  }
}
