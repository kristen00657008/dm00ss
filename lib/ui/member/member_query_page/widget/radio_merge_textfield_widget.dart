import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pro;

class RadioMergeTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final List<String> dataList;
  final StateProvider<String> provider;

  const RadioMergeTextFieldWidget({
    super.key,
    required this.title,
    required this.dataList,
    required this.provider,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(title),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: dataList
                        .asMap()
                        .entries
                        .map(
                          (e) => Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  (context.read<ScreenSize>().screenWidth *
                                              0.75 -
                                          10) /
                                      dataList.length,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  visualDensity: VisualDensity(horizontal: -4),
                                  value: e.value,
                                  groupValue: ref.watch(provider),
                                  onChanged: (value) {
                                    ref.read(provider.notifier).state =
                                        value ?? dataList.first;
                                  },
                                ),
                                Text(
                                  e.value,
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
            Offstage(
              offstage: ref.watch(provider) != dataList.first,
              child: CustomTextField(
                controller: controller,
              ),
            )
          ],
        ),
      );
    });
  }
}
