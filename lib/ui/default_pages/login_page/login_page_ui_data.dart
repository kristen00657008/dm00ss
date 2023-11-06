import 'package:dm00ss/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageUIData {
  static final LoginPageUIData instance = LoginPageUIData._internal();

  factory LoginPageUIData() {
    return instance;
  }

  LoginPageUIData._internal();

  double backgroundViewWidth = 0;
  double backgroundViewHeight = 0;

  double foregroundViewWidth = 0;
  double foregroundViewHeight = 0;

  double fieldWidth = 0;
  double fieldHeight = 0;

  Offset stackOffset = Offset(0,0);
  Offset backgroundViewOffset = Offset(0,0);

  FocusNode accountFieldFocusNode = FocusNode();
  FocusNode pwdFieldFocusNode = FocusNode();

  void init(BuildContext context) {
    backgroundViewHeight = context.read<ScreenSize>().screenHeight * 0.5;
    backgroundViewWidth = context.read<ScreenSize>().screenHeight * 0.35;

    foregroundViewWidth = context.read<ScreenSize>().screenHeight * 0.35;
    foregroundViewHeight = context.read<ScreenSize>().screenHeight * 0.4;

    fieldWidth = foregroundViewWidth * 0.9;
    fieldHeight = foregroundViewHeight * 0.12;

    stackOffset = Offset(0, context.read<ScreenSize>().screenHeight * 0);
    backgroundViewOffset = Offset(backgroundViewWidth * 0.1, 0);
  }
}
