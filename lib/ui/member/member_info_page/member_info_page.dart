import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/widget/common_field_widget.dart';
import 'package:dm00ss/widget/common_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberInfoPage extends ConsumerStatefulWidget {
  const MemberInfoPage({super.key});

  @override
  ConsumerState<MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends ConsumerState<MemberInfoPage> {
  late ThemeStyle currentAppTheme;

  @override
  void initState() {
    super.initState();
    init();

  }
  @override
  void reassemble() {
    super.reassemble();
    init();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      currentAppTheme = ref.watch(themeProvider);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: currentAppTheme.scaffoldColor2,
      ));
      return Column(
        children: [
          Expanded(
            child: CommonScrollView(
              scrollController: ScrollController(),
              child: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return buildField(index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                  itemCount: data.length,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildField(int index) {
    String title = data.keys.elementAt(index);
    String value = data.values.elementAt(index);

    return CommonFieldWidget(
        themeStyle: currentAppTheme, title: title, value: value);
  }

  void init() {
    data = {
      "*會員編號" : "12345000013",
      "階級" : "會員*",
      "會員狀況" : "正式",
      "地區別" : "香港",
      "入會地點" : "Billmont",
      "入會方式" : "消費型會員",
      "*入會日期" : "2023/11/29",
      "會員型態" : "自然人",
      "* 身份証號/統一編號" : "A147871733",
      "*姓名(公司名稱)" : "吳大名",
      "* 推薦人" : "12345000011 香港會員 (M9425727)",
      "出生日期" : "",
      "* 性別" : "男",
      "電子信箱" : "",
      "住宅電話" : "035919191",
      "公司電話" : "",
      "傳真號碼" : "",
      "* 行動電話" : "0928181811",
      "行動電話2" : "",
      "法定代理人" : "",
      "法定代理人關係" : "",
      "負責人" : "",
      "負責人証號" : "",
      "聯絡人" : "",
      "公司成立日期" : "",
      "憑單填發方式" :  "紙本憑單",
      "預設捐贈碼" : "",
      "是否綁定Line帳戶" : "否",
      "是否綁定FB帳戶" : "否",
      "是否綁定Google帳戶" : "否",
      "修改原因" : "",
      "備註" : "",
    };
  }

  late Map<String, String> data;

}

