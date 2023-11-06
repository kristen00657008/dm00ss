import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/more_button_widget.dart';
import 'package:flutter/material.dart';

class OneTextFieldWidget extends StatelessWidget {
  final String title;
  final bool showMoreButton;
  final VoidCallback? moreButtonCallback;
  final TextEditingController controller = TextEditingController();

  OneTextFieldWidget(
    this.title, {
    super.key,
    this.showMoreButton = false,
    this.moreButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(title),
                ),
                if (showMoreButton)
                  Expanded(
                    flex: 1,
                    child: MoreButton(
                      onTap: moreButtonCallback,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: AutoSizeTextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
