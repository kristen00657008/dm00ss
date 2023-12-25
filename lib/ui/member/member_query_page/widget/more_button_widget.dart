import 'package:dm00ss/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreButton extends StatelessWidget {
  final VoidCallback? onTap;

  const MoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var currentAppTheme = ref.watch(themeProvider);
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: currentAppTheme.secondary,
          ),
          child: Icon(
            Icons.more_horiz,
            size: 20,
          ),
        ),
      );
    });
  }
}
