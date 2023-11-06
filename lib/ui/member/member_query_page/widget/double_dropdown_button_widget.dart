import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoubleDropdownButtonWidget extends StatelessWidget {
  final String title;
  final List<String> dataList;
  final StateProvider<String> provider1;
  final StateProvider<String> provider2;

  const DoubleDropdownButtonWidget({
    super.key,
    required this.title,
    required this.dataList,
    required this.provider1,
    required this.provider2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: CustomDropdownButton(
                  dataList: dataList,
                  provider: provider1,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("~"),
                ),
              ),
              Expanded(
                flex: 8,
                child: CustomDropdownButton(
                  dataList: dataList,
                  provider: provider2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
