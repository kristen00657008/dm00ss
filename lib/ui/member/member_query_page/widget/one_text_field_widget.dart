import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_text_field.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/more_button_widget.dart';
import 'package:flutter/material.dart';

class OneTextFieldWidget extends StatelessWidget {
  final String title;
  final bool showMoreButton;
  final VoidCallback? moreButtonCallback;
  final TextEditingController controller;

  const OneTextFieldWidget(
    this.title, {
    super.key,
    this.showMoreButton = false,
    this.moreButtonCallback,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(title),
              if (showMoreButton)
                MoreButton(
                  onTap: moreButtonCallback,
                ),
            ],
          ),
          CustomTextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
