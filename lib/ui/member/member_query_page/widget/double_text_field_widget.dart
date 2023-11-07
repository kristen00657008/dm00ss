import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_text_field.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/more_button_widget.dart';
import 'package:flutter/material.dart';

class DoubleTextFieldWidget extends StatelessWidget {
  final String title;
  final bool showMoreButton1;
  final bool showMoreButton2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final VoidCallback? moreButton1Callback;
  final VoidCallback? moreButton2Callback;
  final bool twoLine;

  const DoubleTextFieldWidget({
    super.key,
    required this.title,
    required this.showMoreButton1,
    required this.showMoreButton2,
    required this.controller1,
    required this.controller2,
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
                if (title.isNotEmpty)
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
                child: CustomTextField(
                  controller: controller1,
                ),
              ),
              if (showMoreButton1)
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
                child: CustomTextField(
                  controller: controller2,
                ),
              ),
              if (showMoreButton2)
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
