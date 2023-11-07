import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/check_box_group_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/order_field_widget.dart';
import 'package:flutter/material.dart';

class OtherExpansionWidget extends StatelessWidget {
  final MemberQueryModel model;

  const OtherExpansionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border(bottom: BorderSide(color: Colors.black12)),
      childrenPadding: EdgeInsets.only(bottom: 10),
      title: Text('其他'),
      tilePadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        OneDropdownButtonWidget(
          "可否瀏覽",
          dataList: model.canBrowseValues,
          provider: model.selectedCanBrowseProvider,
        ),
        OneDropdownButtonWidget(
          "已購事業手冊",
          dataList: model.purchasedManualValues,
          provider: model.selectedPurchasedManualProvider,
        ),
        OneDropdownButtonWidget(
          "報表種類",
          dataList: model.reportTypeValues,
          provider: model.selectedReportTypeProvider,
        ),
        OneDropdownButtonWidget(
          "獎金領取方式",
          dataList: model.bonusReceiveMethodValues,
          provider: model.selectedBonusReceiveMethodProvider,
        ),
        CheckBoxGroupWidget(
          title: "特殊設定",
          dataList: model.specialSettingsValues,
          selectedOptions: model.selectedSpecialSettingsMethod,
          multiple: true,
        ),
        OrderFieldWidget(),
      ],
    );
  }
}
