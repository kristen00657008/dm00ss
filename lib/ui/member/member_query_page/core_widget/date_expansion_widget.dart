import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:flutter/material.dart';

import '../widget/double_text_field_widget.dart';

class DateExpansionWidget extends StatelessWidget {
  final MemberQueryModel model;

  const DateExpansionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border(
        bottom: BorderSide(color: Colors.black12),
      ),
      title: Text('日期相關'),
      childrenPadding: EdgeInsets.only(bottom: 10),
      tilePadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        DoubleTextFieldWidget(
          title: "入會日期",
          showMoreButton1: true,
          showMoreButton2: true,
          controller1: model.joinDateController1,
          controller2: model.joinDateController2,
        ),
        DoubleTextFieldWidget(
          title: "退出日期",
          showMoreButton1: true,
          showMoreButton2: true,
          controller1: model.withdrawDateController1,
          controller2: model.withdrawDateController2,
        ),
        DoubleTextFieldWidget(
          title: "審核日期",
          showMoreButton1: true,
          showMoreButton2: true,
          controller1: model.reviewDateController1,
          controller2: model.reviewDateController2,
        ),
        DoubleTextFieldWidget(
          title: "到期日",
          showMoreButton1: true,
          showMoreButton2: true,
          controller1: model.expiryDateController1,
          controller2: model.expiryDateController2,
        ),
      ],
    );
  }
}
