import 'package:dio/dio.dart';
import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/repository/app_repository.dart';
import 'package:dm00ss/repository/memer_repository.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/default_pages/default_page/drawer_view.dart';
import 'package:dm00ss/widget/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bean/base/base_result.dart';
import '../enum/status_code.dart';
import '../ui/default_pages/login_page/widget/core_widget/foreground_view.dart';

class DefaultView extends StatefulWidget {
  final Widget child;

  const DefaultView({super.key, required this.child});

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      ThemeStyle currentAppTheme = ref.watch(themeProvider);
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: currentAppTheme.scaffoldColor2,
        ),
        child: Scaffold(
          drawer: DrawerView(),
          drawerEnableOpenDragGesture: false,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      currentAppTheme.scaffoldColor1,
                      currentAppTheme.scaffoldColor2
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  CommonAppBar(),
                  Expanded(child: widget.child),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              MemberRepository.getInstance()
                  .getCodeType("MemberType")
                  // .getMenu()
                  // .userPasswordMail("admin")
                  // .getLatestNews()
                  // .userPasswordModify("mldemo", "mldemo2")
                  .listen((event) {
              }).onError((e) {
                if (e is DioException && e.error is BaseResult) {
                  BaseResult errorResult = e.error as BaseResult;
                  if (errorResult.error != null) {
                    showCustomDialog(context, errorResult.error!.message);
                  }
                }
              });
            },
            child: Text("測試"),
          ),
        ),
      );
    });
  }
}
