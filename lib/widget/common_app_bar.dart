import 'package:dio/dio.dart';
import 'package:dm00ss/bean/base/base_result.dart';
import 'package:dm00ss/enum/status_code.dart';
import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/repository/memer_repository.dart';
import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/default_pages/login_page/widget/core_widget/foreground_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as pro;

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
        return AppBar(
          title: Text(getPageTitle(ref.watch(pageProvider))),
          centerTitle: true,
          actions: [buildMenu()],
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        );
      }
    );
  }

  String getPageTitle(PageName pageName) {
    switch (pageName) {
      case PageName.FastNewsPage:
        return "最新消息";
      case PageName.MemberQueryPage:
        return "會員查詢";
      case PageName.MemberInfoPage:
        return "會員基本資料";
      default:
        return "錯誤標題";
    }
  }

  Widget buildMenu() {
    return PopupMenuButton(
      icon: Icon(Icons.adaptive.more, color: Colors.white),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Text('取得參數'),
          onTap: () {
            MemberRepository()
                .getBWEX()
                .listen((event) {
              if(event.statusCode == StatusCode.code200) {
                print(event.result?.first.bsitm);
              }
            }).onError((e) {
              if (e is DioException && e.error is BaseResult) {
                BaseResult errorResult = e.error as BaseResult;
                if(errorResult.error != null) {
                  showCustomDialog(context, errorResult.error!.message);
                }
              }
            });
          },
        ),
        PopupMenuItem(
          child: Text('取得使用者登入分公司'),
          onTap: () {
            MemberRepository()
                .getLoginOrg()
                .listen((event) {
              if(event.statusCode == StatusCode.code200) {
                print(event.result?.first.companyNames);
              }
            }).onError((e) {
              if (e is DioException && e.error is BaseResult) {
                BaseResult errorResult = e.error as BaseResult;
                if(errorResult.error != null) {
                  showCustomDialog(context, errorResult.error!.message);
                }
              }
            });
          },
        ),
        PopupMenuItem(
          child: Text('版型設定'),
          onTap: () {
          },
        ),
        PopupMenuItem(
          child: Text('版型設定'),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showSettingDialog(context);
            });
          },
        ),
        const PopupMenuItem(
          child: Text('密碼修改'),
        ),
        PopupMenuItem(
          child: Text('登出'),
          onTap: () {
            MemberRepository().signOut().listen((event) {
              context.pushReplacement('/');
            }).onError((e) {
              if (e is DioException && e.error is BaseResult) {
                BaseResult errorResult = e.error as BaseResult;
                if (errorResult.error != null) {
                  showCustomDialog(context, errorResult.error!.message);
                }
              }
            });
          },
        ),
      ],
    );
  }

  void showSettingDialog(BuildContext context) {
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
    return Consumer(builder: (context, ref, _) {
      var currentAppTheme = ref.watch(themeProvider);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: context.read<ScreenSize>().screenWidth * 0.35,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: currentAppTheme.secondary,
            child: Center(child: Text("整體色系")),
          ),
          Container(
            height: 50,
            color: Theme.of(context).dividerColor,
            width: context.read<ScreenSize>().screenWidth * 0.35,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<ThemeStyle>(
                value: currentAppTheme,
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
                  updateTheme(ref, value ?? themeData.first);
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
