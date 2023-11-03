import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'drawer_view.dart';
import 'news_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: context.read<ThemeProvider>().currentAppTheme.backgroundColor,
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
            Scaffold(
              backgroundColor: Colors.transparent,
              drawerEnableOpenDragGesture: false,
              drawer: DrawerView(),
              appBar: AppBar(
                title: Text("直銷管理系統"),
                centerTitle: true,
                actions: [buildMenu()],
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarColor: context.read<ThemeProvider>().currentAppTheme.backgroundColor,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: NewsView(),
              ),
            ),
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
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
}
