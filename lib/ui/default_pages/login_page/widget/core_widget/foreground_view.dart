import 'package:auto_size_text/auto_size_text.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:dm00ss/ui/default_pages/login_page/widget/custom_widget/custom_field.dart';
import 'package:dm00ss/ui/default_pages/login_page/widget/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../custom_widget/custom_dropdown_button.dart';

class ForegroundView extends StatefulWidget {
  final LoginPageUIData loginPageUIData;

  const ForegroundView({super.key, required this.loginPageUIData});

  @override
  State<ForegroundView> createState() => _ForegroundViewState();
}

class _ForegroundViewState extends State<ForegroundView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.loginPageUIData.foregroundViewWidth,
      height: widget.loginPageUIData.foregroundViewHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDropdownButton(
            loginPageUIData: widget.loginPageUIData,
          ),
          CustomTextField(
            hintText: '帳號',
            textFieldFocusNode: widget.loginPageUIData.accountFieldFocusNode,
            loginPageUIData: widget.loginPageUIData,
          ),
          CustomTextField(
            hintText: '密碼',
            textFieldFocusNode: widget.loginPageUIData.pwdFieldFocusNode,
            loginPageUIData: widget.loginPageUIData,
          ),
          CustomField(
            loginPageUIData: widget.loginPageUIData,
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacement('/homepage');
              },
              child: const AutoSizeText("登入"),
            ),
          ),
          CustomField(
            loginPageUIData: widget.loginPageUIData,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: AutoSizeText("密碼提示"),
                ),
                TextButton(
                  onPressed: () {},
                  child: AutoSizeText("密碼寄送"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
