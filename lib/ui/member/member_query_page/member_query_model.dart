import 'package:dm00ss/enum/org_kind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 會員查詢物件
class MemberQueryModel {
  MemberQueryModel._internal();

  static final MemberQueryModel _singleton = MemberQueryModel._internal();

  static MemberQueryModel getInstance() => _singleton;

  factory MemberQueryModel() => _singleton;

  final orgKind = OrgKind.SunLine;

  /// 地區別
  final List<String> areaValues = ["ALL", "台灣", "美國", "香港", "中國"];
  final StateProvider<String> selectedAreaProvider =
      StateProvider((ref) => "ALL");

  /// 階級
  final List<String> levelValues = ["ALL", "會員*", "會員", "VIP", "一星"];
  final StateProvider<String> selectedLevelProvider1 =
      StateProvider((ref) => "ALL");
  final StateProvider<String> selectedLevelProvider2 =
      StateProvider((ref) => "ALL");

  /// 會員型態
  final List<String> memberTypeValues = [
    "ALL",
    "自然人",
    "法人",
    "外國人",
    "大陸人士",
    "員工"
  ];
  final StateProvider<String> selectedMemberTypeProvider =
      StateProvider((ref) => "ALL");

  /// 會員狀況
  final memberStatusValues = ["正式", "停權", "開除", "移轉"];
  final List<bool> selectedMemberStatus = List.generate(4, (index) => true);

  /// 入會方式
  final joinMethodValues = ["消費型會員", "一般"];
  final List<bool> selectedJoinMethod = List.generate(2, (index) => true);

  /// 性別
  final List<String> genderValues = ["ALL", "", "男", "女"];
  final StateProvider<String> selectedGenderProvider =
      StateProvider((ref) => "ALL");

  /// 入會地點
  final List<String> joinLocationValues = ["ALL", "Billmont", "sale", "西門銷售"];
  final StateProvider<String> selectedJoinLocationProvider =
      StateProvider((ref) => "ALL");

  /// 生日月份
  final List<String> birthdayMonthValues = [
    "ALL",
    "01月",
    "02月",
    "03月",
    "04月",
    "05月",
    "06月",
    "07月",
    "08月",
    "09月",
    "10月",
    "11月",
    "12月"
  ];
  final StateProvider<String> selectedBirthdayMonthProvider =
      StateProvider((ref) => "ALL");

  /// 電子信箱查詢條件
  final List<String> emailQueryValues = ["查詢條件", "查詢空值", "查詢非空值"];
  final StateProvider<String> selectedEmailQueryProvider =
      StateProvider((ref) => "查詢條件");

  /// 電子信箱查詢條件
  final List<String> mobilePhone2QueryValues = ["查詢條件", "查詢空值", "查詢非空值"];
  final StateProvider<String> selectedMobilePhone2Provider =
      StateProvider((ref) => "查詢條件");

  /// 電子信箱查詢條件
  final List<String> cityQueryValues = ["戶籍縣市", "通訊縣市"];
  final StateProvider<String> selectedCityQueryProvider =
      StateProvider((ref) => "戶籍縣市");

  /// 可否瀏覽
  final List<String> canBrowseValues = ["ALL", "是", "否"];
  final StateProvider<String> selectedCanBrowseProvider =
      StateProvider((ref) => "ALL");

  /// 已購事業手冊
  final List<String> purchasedManualValues = ["ALL", "是", "否"];
  final StateProvider<String> selectedPurchasedManualProvider =
      StateProvider((ref) => "ALL");

  /// 報表種類
  final List<String> reportTypeValues = [
    "一般",
    "(含)下線會員",
    "(含)上線會員",
    "地址空白",
    "地址非空值"
  ];
  final StateProvider<String> selectedReportTypeProvider =
      StateProvider((ref) => "一般");

  /// 獎金領取方式
  final List<String> bonusReceiveMethodValues = ["ALL", "一銀轉帳"];
  final StateProvider<String> selectedBonusReceiveMethodProvider =
      StateProvider((ref) => "ALL");

  /// 特殊設定
  final specialSettingsValues = ["郵件註記", "電訪註記", "法人代扣稅額", "法人零稅率"];
  final List<bool> selectedSpecialSettingsMethod =
      List.generate(4, (index) => false);

  /// 排序
  final List<String> conditionValues = [
    "郵遞區號",
    "入會地點",
    "地區別",
    "階級",
    "會員編號",
    "入會日期",
    "會員姓名",
  ];

  final List<String> conditionTypeValues = [
    "遞增",
    "遞減",
  ];

  final List<StateProvider<String>> selectedConditionProviders = [
    StateProvider((ref) => "會員編號"),
    StateProvider((ref) => "郵遞區號"),
    StateProvider((ref) => "階級"),
  ];

  final List<StateProvider<String>> selectedConditionTypeProviders = [
    StateProvider((ref) => "遞減"),
    StateProvider((ref) => "遞增"),
    StateProvider((ref) => "遞增"),
  ];

  late ScrollController scrollController;
  late TextEditingController memberIdController1;
  late TextEditingController memberIdController2;
  late TextEditingController memberNameController;
  late TextEditingController idController;
  late TextEditingController recommendController;
  late TextEditingController parentMemberController;
  late TextEditingController joinDateController1;
  late TextEditingController joinDateController2;
  late TextEditingController withdrawDateController1;
  late TextEditingController withdrawDateController2;
  late TextEditingController reviewDateController1;
  late TextEditingController reviewDateController2;
  late TextEditingController expiryDateController1;
  late TextEditingController expiryDateController2;
  late TextEditingController emailController;
  late TextEditingController mobilePhoneController1;
  late TextEditingController mobilePhoneController2;
  late TextEditingController phoneController;
  late TextEditingController postalCodeController1;
  late TextEditingController postalCodeController2;
  late TextEditingController cityController1;
  late TextEditingController cityController2;
  late TextEditingController addressController;
  late TextEditingController ageController1;
  late TextEditingController ageController2;
  late TextEditingController bankAccountController;
  late TextEditingController bankController;

  void init() {
    initController();
  }

  void initController() {
    scrollController = ScrollController();
    memberIdController1 = TextEditingController();
    memberIdController2 = TextEditingController();
    memberNameController = TextEditingController();
    idController = TextEditingController();
    recommendController = TextEditingController();
    parentMemberController = TextEditingController();
    joinDateController1 = TextEditingController();
    joinDateController2 = TextEditingController();
    withdrawDateController1 = TextEditingController();
    withdrawDateController2 = TextEditingController();
    reviewDateController1 = TextEditingController();
    reviewDateController2 = TextEditingController();
    expiryDateController1 = TextEditingController();
    expiryDateController2 = TextEditingController();
    emailController = TextEditingController();
    mobilePhoneController1 = TextEditingController();
    mobilePhoneController2 = TextEditingController();
    phoneController = TextEditingController();
    postalCodeController1 = TextEditingController();
    postalCodeController2 = TextEditingController();
    cityController1 = TextEditingController();
    cityController2 = TextEditingController();
    addressController = TextEditingController();
    ageController1 = TextEditingController();
    ageController2 = TextEditingController();
    bankAccountController = TextEditingController();
    bankController = TextEditingController();
  }
}
