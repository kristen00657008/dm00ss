import 'package:dm00ss/ui/member/member_info_page/data/data.dart';
import 'package:flutter/material.dart';

/// 會員基本資料物件
class MemberInfoModel {
  MemberInfoModel._internal();

  static final MemberInfoModel _singleton = MemberInfoModel._internal();

  static MemberInfoModel getInstance() => _singleton;

  factory MemberInfoModel() => _singleton;

  late TabController tabController;

  void init(TickerProvider provider) {
    tabController = TabController(
        length: MemberInfoTabs.values.length,
        vsync: provider,
        animationDuration: Duration(milliseconds: 500));

    tabController.addListener(() {});
  }

  Map<String, String> getDataMap(String title) {
    switch (title) {
      case '基本':
        return basicData;
      case '地址/帳號':
        return addressData;
      case '經營狀況':
        return manageData;
      case '審核狀況':
        return reviewData;
      case '特殊設定':
        return specialData;
      case '自動訂貨':
        return basicData;
      case '溢收款明細':
        return basicData;
      case '晉升狀況':
        return basicData;
      case '課程紀錄':
        return basicData;
      case '第一代會員':
        return basicData;

      default:
        return basicData;
    }
  }
}
