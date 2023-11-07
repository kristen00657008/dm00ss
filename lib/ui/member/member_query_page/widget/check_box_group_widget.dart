import 'package:dm00ss/style/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;

class CheckBoxGroupWidget extends StatefulWidget {
  final String title;
  final List<String> dataList;
  final List<bool?> selectedOptions;
  final bool multiple;

  const CheckBoxGroupWidget({
    super.key,
    required this.title,
    required this.dataList,
    required this.selectedOptions,
    this.multiple = false,
  });

  @override
  State<CheckBoxGroupWidget> createState() => _CheckBoxGroupWidgetState();
}

class _CheckBoxGroupWidgetState extends State<CheckBoxGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return pro.Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(widget.title)),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.vertical,
                children: widget.dataList.asMap().entries.map((e) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: themeProvider.currentAppTheme.secondary,
                          value: widget.selectedOptions[e.key],
                          onChanged: (value) {
                            setState(() {
                              widget.selectedOptions[e.key] = value;
                            });
                          },
                        ),
                        Text(e.value)
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
