import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:flutter/material.dart';

class CityFieldWidget extends StatelessWidget {
  const CityFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("縣市"),
                ),
              ),
              Expanded(
                flex: 4,
                child: OneDropdownButtonWidget(
                  "",
                  dataList: MemberQueryModel.getInstance().cityQueryValues,
                  provider:
                      MemberQueryModel.getInstance().selectedCityQueryProvider,
                ),
              )
            ],
          ),
        ),
        DoubleTextFieldWidget(
          title: '',
          showMoreButton1: false,
          showMoreButton2: false,
          twoLine: false,
          controller1: MemberQueryModel.getInstance().cityController1,
          controller2: MemberQueryModel.getInstance().cityController2,
        )
      ],
    );
  }
}
