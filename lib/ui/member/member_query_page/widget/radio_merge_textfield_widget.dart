import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pro;

class RadioMergeTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController = TextEditingController();
  final List<String> dataList;
  final StateProvider<String> provider;

  RadioMergeTextFieldWidget({
    super.key,
    required this.title,
    required this.dataList,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(title),
                ),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        ...dataList.asMap().entries.map((e) => Container(
                              constraints: BoxConstraints(
                                maxWidth: (context.read<ScreenSize>().screenWidth * 0.75 - 10) / dataList.length,
                              ),
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                visualDensity: VisualDensity(horizontal: -4),
                                title: Text(e.value),
                                value: e.value,
                                groupValue: ref.watch(provider),
                                onChanged: (value) {
                                    ref.read(provider.notifier).state =
                                        value ?? dataList.first;
                                  },
                              ),
                            ),
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
          Offstage(
            offstage: ref.watch(provider) != dataList.first,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: AutoSizeTextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  // fillColor: Color(0xFF90CAF9),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
