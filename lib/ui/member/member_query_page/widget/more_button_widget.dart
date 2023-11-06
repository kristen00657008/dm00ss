import 'package:dm00ss/style/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;

class MoreButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return pro.Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
        return InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            margin: EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: themeProvider.currentAppTheme.secondary,
            ),
            child: Icon(
              Icons.more_horiz,
              size: 20,
            ),
          ),
        );
      }
    );
  }
}
