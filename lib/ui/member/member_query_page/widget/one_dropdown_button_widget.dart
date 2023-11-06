import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneDropdownButtonWidget extends StatelessWidget {
  final String title;
  final List<String> dataList;
  final StateProvider<String> provider;

  const OneDropdownButtonWidget(
    this.title, {
    super.key,
    required this.dataList,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 65),
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title),
          ),
          Expanded(
            flex: 3,
            child: CustomDropdownButton(
              dataList: dataList,
              provider: provider,
            ),
          ),
        ],
      ),
    );
  }
}
