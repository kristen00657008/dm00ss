import 'package:dm00ss/style/theme_style.dart';
import 'package:flutter/material.dart';

class CommonFieldWidget extends StatelessWidget {
  final ThemeStyle themeStyle;
  final String title;
  final String value;

  const CommonFieldWidget({
    super.key,
    required this.themeStyle,
    required this.title,
    required this.value,
  });

  final double radius = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: themeStyle.secondary,
                  border: Border(
                    top: BorderSide(color: themeStyle.primary),
                    bottom: BorderSide(color: themeStyle.primary),
                    left: BorderSide(color: themeStyle.primary),
                    right: BorderSide(width: 0, color: themeStyle.primary),
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(radius),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: themeStyle.primary),
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(radius)),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
