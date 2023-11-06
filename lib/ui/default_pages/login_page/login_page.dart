import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'widget/core_widget/background_view.dart';
import 'widget/core_widget/foreground_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: context.read<ThemeProvider>().currentAppTheme.scaffoldColor2,
        ));
        return Scaffold(
          backgroundColor: themeProvider.currentAppTheme.scaffoldColor1,
          body: InkWell(
            onTap: () {
              if (LoginPageUIData.instance.accountFieldFocusNode.hasFocus ||
                  LoginPageUIData.instance.pwdFieldFocusNode.hasFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    themeProvider.currentAppTheme.scaffoldColor1,
                    themeProvider.currentAppTheme.scaffoldColor2,
                  ],
                ),
              ),
              child: Transform.translate(
                offset: LoginPageUIData.instance.stackOffset,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    BackgroundView(loginPageUIData: LoginPageUIData.instance),
                    ForegroundView(loginPageUIData: LoginPageUIData.instance)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
