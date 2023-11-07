import 'package:dm00ss/enum/org_kind.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/check_box_group_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_text_field_widget.dart';
import 'package:flutter/material.dart';

class MainExpansionWidget extends StatelessWidget {
  final MemberQueryModel model;

  const MainExpansionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          OneDropdownButtonWidget(
            "地區別",
            dataList: model.areaValues,
            provider: model.selectedAreaProvider,
          ),
          OneDropdownButtonWidget(
            "入會地點",
            dataList: model.joinLocationValues,
            provider: model.selectedJoinLocationProvider,
          ),
          CheckBoxGroupWidget(
            title: "入會方式",
            dataList: model.joinMethodValues,
            selectedOptions: model.selectedJoinMethod,
          ),
          DoubleTextFieldWidget(
            title: "會員編號",
            showMoreButton1: true,
            showMoreButton2: false,
            controller1: model.memberIdController1,
            controller2: model.memberIdController2,
          ),
          OneTextFieldWidget(
            "會員姓名",
            controller: model.memberNameController,
          ),
          OneTextFieldWidget(
            "身份証號/統一編號",
            controller: model.idController,
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
          OneDropdownButtonWidget(
            "會員型態",
            dataList: model.memberTypeValues,
            provider: model.selectedMemberTypeProvider,
          ),
          DoubleTextFieldWidget(
            title: "入會日期",
            showMoreButton1: true,
            showMoreButton2: true,
            controller1: model.joinDateController1,
            controller2: model.joinDateController2,
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
        ],
      ),
    );
  }
}
