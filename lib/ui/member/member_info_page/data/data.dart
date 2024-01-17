import 'package:dm00ss/ui/member/member_info_page/member_info_page_model.dart';
import 'package:dm00ss/ui/member/member_info_page/model/first_member_data_model.dart';

import '../model/promotion_data_model.dart';

enum MemberInfoTabs {
  basic,
  address,
  manage,
  review,
  special,
  autoOrder,
  collectionDetails,
  promotion,
  courseRecords,
  firstMembers,
}

extension TabsExtension on MemberInfoTabs {
  String get title {
    switch (this) {
      case MemberInfoTabs.basic:
        return "基本";
      case MemberInfoTabs.address:
        return "地址/帳號";
      case MemberInfoTabs.manage:
        return "經營狀況";
      case MemberInfoTabs.review:
        return "審核狀況";
      case MemberInfoTabs.special:
        return "特殊設定";
      case MemberInfoTabs.autoOrder:
        return "自動訂貨";
      case MemberInfoTabs.collectionDetails:
        return "溢收款明細";
      case MemberInfoTabs.promotion:
        return "晉升狀況";
      case MemberInfoTabs.courseRecords:
        return "課程紀錄";
      case MemberInfoTabs.firstMembers:
        return "第一代會員";
      default:
        return '錯誤';
    }
  }

  Map<String, String> get data {
    switch (this) {
      case MemberInfoTabs.basic:
        return manageData;
      case MemberInfoTabs.address:
        return manageData;
      case MemberInfoTabs.manage:
        return manageData;
      case MemberInfoTabs.review:
        return manageData;
      case MemberInfoTabs.special:
        return manageData;
      default:
        return {};
    }
  }

  bool get isDataTable {
    switch (this) {
      case MemberInfoTabs.basic:
      case MemberInfoTabs.address:
      case MemberInfoTabs.manage:
      case MemberInfoTabs.review:
      case MemberInfoTabs.special:
        return false;
      case MemberInfoTabs.autoOrder:
      case MemberInfoTabs.collectionDetails:
      case MemberInfoTabs.promotion:
      case MemberInfoTabs.courseRecords:
      case MemberInfoTabs.firstMembers:
        return true;
      default:
        return false;
    }
  }
}

// Map<String, String> getBasicData(QueryMemberBean? queryMemberBean) {
//   return {
//     "*會員編號": queryMemberBean?.memberID ?? "",
//     "階級": queryMemberBean?.positionName ?? "",
//     "會員狀況": queryMemberBean?.memberStatusName ?? "",
//     "地區別": queryMemberBean?.regionNo ?? "",
//     "入會地點": queryMemberBean?.joinAreaName ?? "",
//     "入會方式": queryMemberBean?.joinTypeName ?? "",
//     "*入會日期": queryMemberBean?.joinDate ?? "",
//     "會員型態": queryMemberBean?.memberTypeName ?? "",
//     "* 身份証號/統一編號": queryMemberBean?.idNo ?? "",
//     "*姓名(公司名稱)": queryMemberBean?.memberName ?? "",
//     "* 推薦人": queryMemberBean?.parentMemberName ?? "",
//     "出生日期": queryMemberBean?.birthday ?? "",
//     "* 性別": queryMemberBean?.sex ?? "",
//     "電子信箱": queryMemberBean?.emailAddress ?? "",
//     "住宅電話": queryMemberBean?.phoneNo ?? "",
//     "公司電話": queryMemberBean?.orgPhoneNo ?? "",
//     "傳真號碼": queryMemberBean?.faxNo ?? "",
//     "* 行動電話": queryMemberBean?.mobileNo ?? "",
//     "行動電話2": queryMemberBean?.mobileNo2 ?? "",
//     "法定代理人": queryMemberBean?.legalAgent ?? "",
//     "法定代理人關係": queryMemberBean?.memberRelation ?? "",
//     "負責人": queryMemberBean?.companyNames ?? "",
//     "負責人証號": queryMemberBean?.companyIdNo ?? "",
//     "聯絡人": queryMemberBean?.contactPerson ?? "",
//     "公司成立日期": queryMemberBean?.companyDate ?? "",
//     "憑單填發方式": "紙本憑單",
//     "預設捐贈碼": "",
//     "是否綁定Line帳戶": "否",
//     "是否綁定FB帳戶": "否",
//     "是否綁定Google帳戶": "否",
//     "修改原因": "",
//     "備註": "",
//   };
// }

// Map<String, String> basicData = {
//   "*會員編號": "12345000013",
//   "階級": "會員*",
//   "會員狀況": "正式",
//   "地區別": "香港",
//   "入會地點": "Billmont",
//   "入會方式": "消費型會員",
//   "*入會日期": "2023/11/29",
//   "會員型態": "自然人",
//   "* 身份証號/統一編號": "A147871733",
//   "*姓名(公司名稱)": "吳大名",
//   "* 推薦人": "12345000011 香港會員 (M9425727)",
//   "出生日期": "",
//   "* 性別": "男",
//   "電子信箱": "",
//   "住宅電話": "035919191",
//   "公司電話": "",
//   "傳真號碼": "",
//   "* 行動電話": "0928181811",
//   "行動電話2": "",
//   "法定代理人": "",
//   "法定代理人關係": "",
//   "負責人": "",
//   "負責人証號": "",
//   "聯絡人": "",
//   "公司成立日期": "",
//   "憑單填發方式": "紙本憑單",
//   "預設捐贈碼": "",
//   "是否綁定Line帳戶": "否",
//   "是否綁定FB帳戶": "否",
//   "是否綁定Google帳戶": "否",
//   "修改原因": "",
//   "備註": "",
// };

// Map<String, String> getAddressData(QueryMemberBean? queryMemberBean) {
//   return {
//     "戶籍地址":
// """郵遞區號  ${queryMemberBean?.curZipCode ?? ""}
// 縣市  ${queryMemberBean?.curCity ?? ""}
// 鄉/鎮/區  ${queryMemberBean?.curTown ?? ""}
// 里/鄰  ${queryMemberBean?.curNeighbor ?? ""}
// 地址		${queryMemberBean?.curAddress ?? ""}
// 國別		${queryMemberBean?.curCountry ?? ""}""",
//     "通訊地址":
// """郵遞區號  ${queryMemberBean?.curZipCode ?? ""}
// 縣市  ${queryMemberBean?.curCity ?? ""}
// 鄉/鎮/區  ${queryMemberBean?.curTown ?? ""}
// 里/鄰  ${queryMemberBean?.curNeighbor ?? ""}
// 地址		${queryMemberBean?.curAddress ?? ""}
// 國別		${queryMemberBean?.curCountry ?? ""}""",
//     "銀行別": queryMemberBean?.bankNo ?? "",
//     "分行別": queryMemberBean?.bankBranch ?? "",
//     "銀行帳號": queryMemberBean?.bankAccount ?? "",
//     "銀行戶名": queryMemberBean?.accountName ?? "",
//     "獎金領取方式": "",
//     "帳號用身份証號": queryMemberBean?.accountIdNo ?? "",
//   };
// }

// Map<String, String> addressData = {
//   "戶籍地址": "",
//   "通訊地址": "",
//   "銀行別": "",
//   "分行別": "",
//   "銀行帳號": "",
//   "銀行戶名": "吳大名",
//   "獎金領取方式": "一銀轉帳",
//   "帳號用身份証號": "A147871733",
// };

Map<String, String> manageData = {
  "英文姓名": "",
  "配偶姓名": "",
  "配偶生日": "",
  "配偶証號": "",
  "異動狀況": "",
};

// Map<String, String> getReviewData(QueryMemberBean? queryMemberBean) {
//   return {
//     "審核情形": queryMemberBean?.approveStatusName ?? "",
//     "審核日期": "2023/11/29",
//     "審核備註": "",
//     "已購事業手冊": queryMemberBean?.royaltyFlag ?? "",
//   };
// }

// Map<String, String> reviewData = {
//   "審核情形": "審核完成",
//   "審核日期": "2023/11/29",
//   "審核備註": "",
//   "已購事業手冊": "否",
// };

// Map<String, String> getSpecialData(QueryMemberBean? queryMemberBean) {
//   return {
//     "密碼": queryMemberBean?.password ?? "",
//     "特殊設定": queryMemberBean?.flagSet ?? "",
//     "訂購註記": queryMemberBean?.orderFlag ?? "",
//     "可否瀏覽": "是",
//   };
// }

// Map<String, String> specialData = {
//   "密碼": "1733",
//   "特殊設定": "",
//   "訂購註記": "是",
//   "可否瀏覽": "是",
// };

Map<String, dynamic> getModelProperties(dynamic model) {
  if (model is PromotionDataModel) {
    return {
      '項次': null,
      '生效日': model.effectiveDate,
      '異動代號': model.changeCode,
      '晉升階級': model.level,
      '原階級': model.originalLevel,
      '說明': model.caption,
      '加入型態': model.joinType,
      '建檔日': model.filingDate,
      '修改人員': model.modifier,
    };
  }
  if (model is FirstMemberDataModel) {
    return {
      '項次': null,
      '會員編號': model.memberID,
      '姓名(公司名稱)': model.memberName,
      '階級': model.level,
      '身份証號/統一編號': model.idNo,
    };
  }
  return {};
}

double getColumnWidth(String title) {
  switch (title) {
    case '項次':
      return 50;
    case '生效日':
      return 120;
    case '異動代號':
      return 100;
    case '晉升階級':
      return 100;
    case '原階級':
      return 100;
    case '說明':
      return 180;
    case '加入型態':
      return 120;
    case '建檔日':
      return 120;
    case '修改人員':
      return 80;
    case '會員編號':
      return 150;
    case '姓名(公司名稱)':
      return 180;
    case '階級':
      return 100;
    case '身份証號/統一編號':
      return 150;
    default:
      return 0;
  }
}
