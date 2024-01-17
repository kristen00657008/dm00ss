import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:dm00ss/bean/base/base_result.dart';
import 'package:dm00ss/enum/status_code.dart';
import 'package:dm00ss/repository/memer_repository.dart';
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
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    accountController.text = "admin";
    pwdController.text = "mldemo";
  }

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
            controller: accountController,
            hintText: '帳號',
            textFieldFocusNode: widget.loginPageUIData.accountFieldFocusNode,
            loginPageUIData: widget.loginPageUIData,
          ),
          CustomTextField(
            controller: pwdController,
            hintText: '密碼',
            textFieldFocusNode: widget.loginPageUIData.pwdFieldFocusNode,
            loginPageUIData: widget.loginPageUIData,
          ),
          CustomField(
            loginPageUIData: widget.loginPageUIData,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                MemberRepository()
                    .signIn(accountController.text, pwdController.text)
                    .listen((event) {
                      if(event.statusCode == StatusCode.code200) {
                        MemberRepository.getInstance().signinBean = event;
                        MemberRepository.getInstance().signinBean?.userLogName = accountController.text;
                        context.pushReplacement('/homepage');
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
              child: const AutoSizeText("登入"),
            ),
          ),
          CustomField(
            loginPageUIData: widget.loginPageUIData,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async {

                  },
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

Future showCustomDialog(BuildContext context, String message) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Center(
        child: Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 200,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}