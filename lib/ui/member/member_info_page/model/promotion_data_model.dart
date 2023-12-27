class PromotionDataModel {
  final String effectiveDate;
  final String changeCode;
  final String level;
  final String originalLevel;
  final String caption;
  final String joinType;
  final String filingDate;
  final String modifier;

  PromotionDataModel({
    required this.effectiveDate,
    required this.changeCode,
    required this.level,
    required this.originalLevel,
    required this.caption,
    required this.joinType,
    required this.filingDate,
    required this.modifier,
  });
}


List<PromotionDataModel> promotionData = [
  PromotionDataModel(
    effectiveDate: '2023/11/29',
    changeCode: '會員加入',
    level: '會員*',
    originalLevel: '會員*',
    caption: 'New Member',
    joinType: '消費型會員',
    filingDate: '2023/11/29',
    modifier: 'Admin',
  ),
  PromotionDataModel(
    effectiveDate: '2023/11/28',
    changeCode: '會員加入',
    level: '會員*',
    originalLevel: '會員*',
    caption: 'New Member',
    joinType: '消費型會員',
    filingDate: '2023/11/28',
    modifier: 'Admin',
  ),
  PromotionDataModel(
    effectiveDate: '2023/11/27',
    changeCode: '會員加入',
    level: '會員*',
    originalLevel: '會員*',
    caption: 'New Member',
    joinType: '消費型會員',
    filingDate: '2023/11/27',
    modifier: 'Admin',
  ),
  PromotionDataModel(
    effectiveDate: '2023/11/26',
    changeCode: '會員加入',
    level: '會員*',
    originalLevel: '會員*',
    caption: 'New Member',
    joinType: '消費型會員',
    filingDate: '2023/11/26',
    modifier: 'Admin',
  )
];