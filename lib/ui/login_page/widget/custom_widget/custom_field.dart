import 'package:dm00ss/ui/login_page/login_page_ui_data.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final Widget child;
  final LoginPageUIData loginPageUIData;
  const CustomField({super.key, required this.child, required this.loginPageUIData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loginPageUIData.fieldWidth,
      height: loginPageUIData.fieldHeight,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }
}
