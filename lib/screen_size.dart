import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenSize with ChangeNotifier, DiagnosticableTreeMixin {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double safeTopPadding = 0.0;

  void updateScreenSize(BuildContext context) async{
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    safeTopPadding = mediaQuery.padding.top;
  }
}
