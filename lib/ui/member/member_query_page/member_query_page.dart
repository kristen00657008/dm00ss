import 'package:dm00ss/enum/org_kind.dart';
import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_dropdown_button.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/check_box_group_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/double_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_dropdown_button_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/one_text_field_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/widget/radio_merge_textfield_widget.dart';
import 'package:dm00ss/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as pro;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberQueryPage extends ConsumerStatefulWidget {
  const MemberQueryPage({super.key});

  @override
  ConsumerState<MemberQueryPage> createState() => _MemberQueryPageState();
}

class _MemberQueryPageState extends ConsumerState<MemberQueryPage> {
  List<bool> selectedOptions = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = pro.Provider.of<ScreenSize>(context);
    return pro.Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.read<ThemeProvider>().currentAppTheme.scaffoldColor2,
      ));
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: themeProvider.currentAppTheme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                ),
                constraints:
                    BoxConstraints(minHeight: screenSize.defaultPageHeight),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    padding: EdgeInsets.zero,
                    children: [
                      ExpansionTile(
                        shape:
                            Border(bottom: BorderSide(color: Colors.black12)),
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        title: Text('會員相關'),
                        tilePadding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          DoubleTextFieldWidget(
                            title: "會員編號",
                            showMoreButton1: true,
                            showMoreButton2: false,
                          ),
                          OneTextFieldWidget("姓名"),
                          OneTextFieldWidget("身份証號/統一編號"),
                          OneTextFieldWidget(
                            "推薦人",
                            showMoreButton: true,
                          ),
                          Offstage(
                            offstage: MemberQueryModel.getInstance().orgKind !=
                                OrgKind.DoubleTrack,
                            child: OneTextFieldWidget(
                              "安置人",
                              showMoreButton: true,
                            ),
                          ),
                          OneDropdownButtonWidget(
                            "地區別",
                            dataList: MemberQueryModel.getInstance().areaValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedAreaProvider,
                          ),
                          OneDropdownButtonWidget(
                            "會員型態",
                            dataList:
                                MemberQueryModel.getInstance().memberTypeValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedMemberTypeProvider,
                          ),
                          DoubleDropdownButtonWidget(
                            title: "階級",
                            dataList:
                                MemberQueryModel.getInstance().levelValues,
                            provider1: MemberQueryModel.getInstance()
                                .selectedLevelProvider1,
                            provider2: MemberQueryModel.getInstance()
                                .selectedLevelProvider2,
                          ),
                          CheckBoxGroupWidget(
                            title: "會員狀況",
                            dataList: MemberQueryModel.getInstance()
                                .memberStatusValues,
                            selectedOptions: MemberQueryModel.getInstance()
                                .selectedMemberStatus,
                          ),
                          CheckBoxGroupWidget(
                            title: "入會方式",
                            dataList:
                                MemberQueryModel.getInstance().joinMethodValues,
                            selectedOptions: MemberQueryModel.getInstance()
                                .selectedJoinMethod,
                          ),
                        ],
                      ),
                      ExpansionTile(
                        shape: Border(
                          bottom: BorderSide(color: Colors.black12),
                        ),
                        title: Text('日期相關'),
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        tilePadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        children: const [
                          DoubleTextFieldWidget(
                            title: "入會日期",
                            showMoreButton1: true,
                            showMoreButton2: true,
                          ),
                          DoubleTextFieldWidget(
                            title: "退出日期",
                            showMoreButton1: true,
                            showMoreButton2: true,
                          ),
                          DoubleTextFieldWidget(
                            title: "審核日期",
                            showMoreButton1: true,
                            showMoreButton2: true,
                          ),
                          DoubleTextFieldWidget(
                            title: "到期日",
                            showMoreButton1: true,
                            showMoreButton2: true,
                          ),
                        ],
                      ),
                      ExpansionTile(
                          shape:
                              Border(bottom: BorderSide(color: Colors.black12)),
                          childrenPadding: EdgeInsets.only(bottom: 10),
                          title: Text('個人資料'),
                          tilePadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          children: [
                            RadioMergeTextFieldWidget(
                              title: "電子信箱",
                              dataList: MemberQueryModel.getInstance()
                                  .emailQueryValues,
                              provider: MemberQueryModel.getInstance()
                                  .selectedEmailQueryProvider,
                            ),
                            OneTextFieldWidget("行動電話"),
                            RadioMergeTextFieldWidget(
                              title: "行動電話2",
                              dataList: MemberQueryModel.getInstance()
                                  .mobilePhone2QueryValues,
                              provider: MemberQueryModel.getInstance()
                                  .selectedMobilePhone2Provider,
                            ),
                            OneTextFieldWidget("住宅電話/公司電話"),
                            DoubleTextFieldWidget(
                              title: "通訊郵遞區號",
                              showMoreButton1: false,
                              showMoreButton2: false,
                            ),
                            OneTextFieldWidget("縣市"),
                            OneTextFieldWidget("通訊地址"),
                            DoubleTextFieldWidget(
                              title: "年齡",
                              showMoreButton1: false,
                              showMoreButton2: false,
                              twoLine: false,
                            ),
                            OneTextFieldWidget("銀行帳號"),
                            OneTextFieldWidget(
                              "銀行別",
                              showMoreButton: true,
                            ),
                            OneDropdownButtonWidget(
                              "性別",
                              dataList:
                                  MemberQueryModel.getInstance().genderValues,
                              provider: MemberQueryModel.getInstance()
                                  .selectedGenderProvider,
                            ),
                            OneDropdownButtonWidget(
                              "入會地點",
                              dataList: MemberQueryModel.getInstance()
                                  .joinLocationValues,
                              provider: MemberQueryModel.getInstance()
                                  .selectedJoinLocationProvider,
                            ),
                            OneDropdownButtonWidget(
                              "生日月分",
                              dataList: MemberQueryModel.getInstance()
                                  .birthdayMonthValues,
                              provider: MemberQueryModel.getInstance()
                                  .selectedBirthdayMonthProvider,
                            )
                          ]),
                      ExpansionTile(
                        shape:
                            Border(bottom: BorderSide(color: Colors.black12)),
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        title: Text('其他'),
                        tilePadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        children: [
                          OneDropdownButtonWidget(
                            "可否瀏覽",
                            dataList:
                                MemberQueryModel.getInstance().canBrowseValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedCanBrowseProvider,
                          ),
                          OneDropdownButtonWidget(
                            "已購事業手冊",
                            dataList: MemberQueryModel.getInstance()
                                .purchasedManualValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedPurchasedManualProvider,
                          ),
                          OneDropdownButtonWidget(
                            "報表種類",
                            dataList:
                                MemberQueryModel.getInstance().reportTypeValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedReportTypeProvider,
                          ),
                          OneDropdownButtonWidget(
                            "獎金領取方式",
                            dataList: MemberQueryModel.getInstance()
                                .bonusReceiveMethodValues,
                            provider: MemberQueryModel.getInstance()
                                .selectedBonusReceiveMethodProvider,
                          ),
                          CheckBoxGroupWidget(
                            title: "特殊設定",
                            dataList: MemberQueryModel.getInstance()
                                .specialSettingsValues,
                            selectedOptions: MemberQueryModel.getInstance()
                                .selectedSpecialSettingsMethod,
                            multiple: true,
                          ),
                          buildOrder(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialCommonButton(
                  backgroundColor: themeProvider.currentAppTheme.secondary,
                  text: "重填",
                  onTap: () {},
                ),
              ),
              Expanded(
                child: MaterialCommonButton(
                  backgroundColor: themeProvider.currentAppTheme.primary,
                  text: "查詢",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget buildOrder() {
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
                    SizedBox(width: 5,),
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
