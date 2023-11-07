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
  List<bool> selectedMemberStatus = List.generate(4, (index) => true);

  /// 入會方式
  final joinMethodValues = ["消費型會員", "一般"];
  List<bool> selectedJoinMethod = List.generate(2, (index) => true);

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
  List<bool> selectedSpecialSettingsMethod =
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

  void search(WidgetRef ref) {
    print("""
    會員編號: ${memberIdController1.text} ~  ${memberIdController2.text}
    姓名: ${memberNameController.text}
    身分證: ${idController.text}
    推薦人: ${recommendController.text}
    安置人: ${parentMemberController.text}
    地區別: ${ref.read(selectedAreaProvider.notifier).state}
    會員型態: ${ref.read(selectedMemberTypeProvider.notifier).state}
    階級: ${ref.read(selectedLevelProvider1.notifier).state} ~ ${ref.read(selectedLevelProvider2.notifier).state}
    會員狀況: $selectedMemberStatus
    入會方式: $selectedJoinMethod
    入會日期: ${joinDateController1.text} ~ ${joinDateController2.text}
    退出日期: ${withdrawDateController1.text} ~ ${withdrawDateController1.text}
    審核日期: ${reviewDateController1.text} ~ ${reviewDateController2.text}
    到期日: ${expiryDateController1.text} ~ ${expiryDateController2.text}
    電子信箱: ${emailController.text}
    行動電話: ${mobilePhoneController1.text}
    行動電話二: ${mobilePhoneController2.text}
    住宅電話: ${phoneController.text}
    郵遞區號: ${postalCodeController1.text} ~ ${postalCodeController2.text}
    縣市: ${ref.read(selectedCityQueryProvider.notifier).state} - ${cityController1.text} ~ ${cityController2.text}
    地址: ${addressController.text}
    年齡: ${ageController1.text} ~ ${ageController2.text}
    銀行帳號: ${bankAccountController.text}
    銀行別: ${bankController.text}
    性別: ${ref.read(selectedGenderProvider.notifier).state}
    入會地點: ${ref.read(selectedJoinLocationProvider.notifier).state}
    生日月分: ${ref.read(selectedBirthdayMonthProvider.notifier).state}
    可否瀏覽: ${ref.read(selectedCanBrowseProvider.notifier).state}
    已購事業手冊: ${ref.read(selectedPurchasedManualProvider.notifier).state}
    報表種類: ${ref.read(selectedReportTypeProvider.notifier).state}
    獎金領取方式: ${ref.read(selectedBonusReceiveMethodProvider.notifier).state}
    特殊設定: $selectedSpecialSettingsMethod
    排序: 
    一 : ${ref.read(selectedConditionProviders[0].notifier).state} - ${ref.read(selectedConditionTypeProviders[0].notifier).state}
    二 : ${ref.read(selectedConditionProviders[1].notifier).state} - ${ref.read(selectedConditionTypeProviders[1].notifier).state}
    三 : ${ref.read(selectedConditionProviders[2].notifier).state} - ${ref.read(selectedConditionTypeProviders[2].notifier).state}
    """);
  }

  void clear(WidgetRef ref) {
    memberIdController1.clear();
    memberIdController2.clear();
    memberNameController.clear();
    idController.clear();
    recommendController.clear();
    parentMemberController.clear();
    joinDateController1.clear();
    joinDateController2.clear();
    withdrawDateController1.clear();
    withdrawDateController2.clear();
    reviewDateController1.clear();
    reviewDateController2.clear();
    expiryDateController1.clear();
    expiryDateController2.clear();
    emailController.clear();
    mobilePhoneController1.clear();
    mobilePhoneController2.clear();
    phoneController.clear();
    postalCodeController1.clear();
    postalCodeController2.clear();
    cityController1.clear();
    cityController2.clear();
    addressController.clear();
    ageController1.clear();
    ageController2.clear();
    bankAccountController.clear();
    bankController.clear();

    ref.invalidate(selectedAreaProvider);
    ref.invalidate(selectedMemberTypeProvider);
    ref.invalidate(selectedLevelProvider1);
    ref.invalidate(selectedLevelProvider2);
    ref.invalidate(selectedCityQueryProvider);
    ref.invalidate(selectedGenderProvider);
    ref.invalidate(selectedJoinLocationProvider);
    ref.invalidate(selectedBirthdayMonthProvider);
    ref.invalidate(selectedCanBrowseProvider);
    ref.invalidate(selectedPurchasedManualProvider);
    ref.invalidate(selectedReportTypeProvider);
    ref.invalidate(selectedBonusReceiveMethodProvider);
    ref.invalidate(selectedEmailQueryProvider);
    ref.invalidate(selectedMobilePhone2Provider);
    for(var provider in selectedConditionProviders) {
      ref.invalidate(provider);
    }
    for(var provider in selectedConditionTypeProviders) {
      ref.invalidate(provider);
    }
    selectedSpecialSettingsMethod =
        List.generate(4, (index) => false);
    selectedMemberStatus = List.generate(4, (index) => true);
    selectedJoinMethod = List.generate(2, (index) => true);
  }

  void dispose() {
    scrollController.dispose();
    memberIdController1.dispose();
    memberIdController2.dispose();
    memberNameController.dispose();
    idController.dispose();
    recommendController.dispose();
    parentMemberController.dispose();
    joinDateController1.dispose();
    joinDateController2.dispose();
    withdrawDateController1.dispose();
    withdrawDateController2.dispose();
    reviewDateController1.dispose();
    reviewDateController2.dispose();
    expiryDateController1.dispose();
    expiryDateController2.dispose();
    emailController.dispose();
    mobilePhoneController1.dispose();
    mobilePhoneController2.dispose();
    phoneController.dispose();
    postalCodeController1.dispose();
    postalCodeController2.dispose();
    cityController1.dispose();
    cityController2.dispose();
    addressController.dispose();
    ageController1.dispose();
    ageController2.dispose();
    bankAccountController.dispose();
    bankController.dispose();
  }
}
