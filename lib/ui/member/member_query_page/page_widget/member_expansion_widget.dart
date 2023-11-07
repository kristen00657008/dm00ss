import 'package:dm00ss/enum/org_kind.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/check_box_group_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_text_field_widget.dart';
import 'package:flutter/material.dart';

class MemberExpansionWidget extends StatelessWidget {
  final MemberQueryModel model;

  const MemberExpansionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border(bottom: BorderSide(color: Colors.black12)),
      childrenPadding: EdgeInsets.only(bottom: 10),
      title: Text('會員相關'),
      tilePadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      initiallyExpanded: true,
      children: [
        DoubleTextFieldWidget(
          title: "會員編號",
          showMoreButton1: true,
          showMoreButton2: false,
          controller1: model.memberIdController1,
          controller2: model.memberIdController2,
        ),
        OneTextFieldWidget(
          "姓名",
          controller: model.memberNameController,
        ),
        OneTextFieldWidget(
          "身份証號/統一編號",
          controller: model.idController,
        ),
        OneTextFieldWidget(
          "推薦人",
          showMoreButton: true,
          controller: model.recommendController,
        ),
        Offstage(
          offstage: model.orgKind != OrgKind.DoubleTrack,
          child: OneTextFieldWidget(
            "安置人",
            showMoreButton: true,
            controller: model.parentMemberController,
          ),
        ),
        OneDropdownButtonWidget(
          "地區別",
          dataList: model.areaValues,
          provider: model.selectedAreaProvider,
        ),
        OneDropdownButtonWidget(
          "會員型態",
          dataList: model.memberTypeValues,
          provider: model.selectedMemberTypeProvider,
        ),
        DoubleDropdownButtonWidget(
          title: "階級",
          dataList: model.levelValues,
          provider1: model.selectedLevelProvider1,
          provider2: model.selectedLevelProvider2,
        ),
        CheckBoxGroupWidget(
          title: "會員狀況",
          dataList: model.memberStatusValues,
          selectedOptions: model.selectedMemberStatus,
        ),
        CheckBoxGroupWidget(
          title: "入會方式",
          dataList: model.joinMethodValues,
          selectedOptions: model.selectedJoinMethod,
        ),
      ],
    );
  }
}
