import 'package:dm00ss/bean/query_member/query_member_bean.dart';
import 'package:dm00ss/ui/member/member_info_page/data/data.dart';
import 'package:flutter/material.dart';

/// 會員基本資料物件
class MemberInfoModel {
  MemberInfoModel._internal();

  static final MemberInfoModel _singleton = MemberInfoModel._internal();

  static MemberInfoModel getInstance() => _singleton;

  factory MemberInfoModel() => _singleton;

  late TabController tabController;

  QueryMemberBean? queryMemberBean;

  void init(TickerProvider provider) {
    tabController = TabController(
        length: MemberInfoTabs.values.length,
        vsync: provider,
        animationDuration: Duration(milliseconds: 500));

    tabController.addListener(() {});
  }

}
