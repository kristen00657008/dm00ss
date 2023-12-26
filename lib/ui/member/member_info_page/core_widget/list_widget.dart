import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/widget/common_field_widget.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  final ThemeStyle themeStyle;
  final Map<String, String> data;

  const ListWidget({super.key, required this.themeStyle, required this.data});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (BuildContext context, int index) {
        return buildField(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
      itemCount: widget.data.length,
    );
  }

  Widget buildField(int index) {
    String title = widget.data.keys.elementAt(index);
    String value = widget.data.values.elementAt(index);

    return CommonFieldWidget(
      themeStyle: widget.themeStyle,
      title: title,
      value: value,
    );
  }
}
