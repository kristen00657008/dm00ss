import 'package:dm00ss/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonBackgroundView extends StatelessWidget {
  final Widget child;

  const CommonBackgroundView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var currentAppTheme = ref.watch(themeProvider);
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 0),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: currentAppTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            child: child,
          ),
        ),
      );
    });
  }
}
