import 'package:auto_size_text/auto_size_text.dart';
import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';

class BackgroundView extends StatefulWidget {
  final LoginPageUIData loginPageUIData;

  const BackgroundView({super.key, required this.loginPageUIData});

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var currentAppTheme = ref.watch(themeProvider);
      return Transform.translate(
        offset: widget.loginPageUIData.backgroundViewOffset,
        child: Container(
          width: widget.loginPageUIData.backgroundViewWidth,
          height: widget.loginPageUIData.backgroundViewHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: widget.loginPageUIData.backgroundViewWidth,
                height: (widget.loginPageUIData.backgroundViewHeight -
                        widget.loginPageUIData.foregroundViewHeight) /
                    2,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 5, left: 5, bottom: 3),
                child: const AutoSizeText(
                  "歡迎使用偉盟系統",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: (widget.loginPageUIData.backgroundViewHeight -
                          widget.loginPageUIData.foregroundViewHeight) /
                      2,
                  margin: const EdgeInsets.only(bottom: 0, right: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<ThemeStyle>(
                      value: currentAppTheme,
                      items: themeData.map((ThemeStyle value) {
                        return DropdownMenuItem<ThemeStyle>(
                          value: value,
                          child: AutoSizeText(
                            value.name,
                            style: TextStyle(color: value.primary),
                          ),
                        );
                      }).toList(),
                      selectedItemBuilder: (context) {
                        return themeData.map((ThemeStyle value) {
                          return DropdownMenuItem<ThemeStyle>(
                            value: value,
                            child: AutoSizeText(
                              value.name,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList();
                      },
                      onChanged: (ThemeStyle? value) {
                        updateTheme(ref, value ?? themeData.first);
                      },
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
