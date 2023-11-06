import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/more_button_widget.dart';
import 'package:flutter/material.dart';

class DoubleTextFieldWidget extends StatelessWidget {
  final String title;
  final bool showMoreButton1;
  final bool showMoreButton2;
  final VoidCallback? moreButton1Callback;
  final VoidCallback? moreButton2Callback;
  final bool twoLine;

  const DoubleTextFieldWidget({
    super.key,
    required this.title,
    required this.showMoreButton1,
    required this.showMoreButton2,
    this.moreButton1Callback,
    this.moreButton2Callback,
    this.twoLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: twoLine
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                buildFields(),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(title),
                ),
                Expanded(
                  flex: 3,
                  child: buildFields(),
                )
              ],
            ),
    );
  }

  Widget buildFields() {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: AutoSizeTextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(15),
                  ),
                ),
              ),
              if(showMoreButton1)
                Expanded(
                  flex: 1,
                  child: MoreButton(
                    onTap: moreButton1Callback,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text("~"),
          ),
        ),
        Expanded(
          flex: 8,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: AutoSizeTextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(15),
                  ),
                ),
              ),
              if(showMoreButton2)
                Expanded(
                  flex: 1,
                  child: MoreButton(
                    onTap: moreButton2Callback,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
