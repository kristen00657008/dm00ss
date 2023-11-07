import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_dropdown_button.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderFieldWidget extends StatelessWidget {
  const OrderFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("排序"),
          Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.vertical,
            children: ["條件一", "條件二", "條件三"].asMap().entries.map((e) {
              return Container(
                width: context.read<ScreenSize>().screenWidth - 20,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(e.value),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: CustomDropdownButton(
                          dataList:
                              MemberQueryModel.getInstance().conditionValues,
                          provider: MemberQueryModel.getInstance()
                              .selectedConditionProviders[e.key],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomDropdownButton(
                        dataList:
                            MemberQueryModel.getInstance().conditionTypeValues,
                        provider: MemberQueryModel.getInstance()
                            .selectedConditionTypeProviders[e.key],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
