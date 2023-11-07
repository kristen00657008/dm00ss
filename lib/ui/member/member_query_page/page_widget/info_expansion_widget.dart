import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/city_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/radio_merge_textfield_widget.dart';
import 'package:flutter/material.dart';

class InfoExpansionWidget extends StatelessWidget {
  final MemberQueryModel model;

  const InfoExpansionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        shape: Border(bottom: BorderSide(color: Colors.black12)),
        childrenPadding: EdgeInsets.only(bottom: 10),
        title: Text('個人資料'),
        tilePadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        children: [
          RadioMergeTextFieldWidget(
            title: "電子信箱",
            dataList: model.emailQueryValues,
            provider: model.selectedEmailQueryProvider,
            controller: model.emailController,
          ),
          OneTextFieldWidget(
            "行動電話",
            controller: model.mobilePhoneController1,
          ),
          RadioMergeTextFieldWidget(
            title: "行動電話2",
            dataList: model.mobilePhone2QueryValues,
            provider: model.selectedMobilePhone2Provider,
            controller: model.mobilePhoneController2,
          ),
          OneTextFieldWidget(
            "住宅電話/公司電話",
            controller: model.phoneController,
          ),
          DoubleTextFieldWidget(
            title: "通訊郵遞區號",
            showMoreButton1: false,
            showMoreButton2: false,
            controller1: model.postalCodeController1,
            controller2: model.postalCodeController2,
          ),
          CityFieldWidget(),
          OneTextFieldWidget(
            "通訊地址",
            controller: model.addressController,
          ),
          DoubleTextFieldWidget(
            title: "年齡",
            showMoreButton1: false,
            showMoreButton2: false,
            twoLine: false,
            controller1: model.ageController1,
            controller2: model.ageController2,
          ),
          OneTextFieldWidget(
            "銀行帳號",
            controller: model.bankAccountController,
          ),
          OneTextFieldWidget(
            "銀行別",
            showMoreButton: true,
            controller: model.bankController,
          ),
          OneDropdownButtonWidget(
            "性別",
            dataList: model.genderValues,
            provider: model.selectedGenderProvider,
          ),
          OneDropdownButtonWidget(
            "入會地點",
            dataList: model.joinLocationValues,
            provider: model.selectedJoinLocationProvider,
          ),
          OneDropdownButtonWidget(
            "生日月分",
            dataList: model.birthdayMonthValues,
            provider: model.selectedBirthdayMonthProvider,
          )
        ]);
  }
}
