class FirstMemberDataModel {
  final String memberID;
  final String memberName;
  final String level;
  final String idNo;

  FirstMemberDataModel({
    required this.memberID,
    required this.memberName,
    required this.level,
    required this.idNo,
  });
}


List<FirstMemberDataModel> firstMemberData = [
  FirstMemberDataModel(
      memberID: '8601000002',
      memberName: '中港股份有限公司',
      level: '一星',
      idNo: '49780735'
  ),
  FirstMemberDataModel(
      memberID: '8601000013',
      memberName: '張于愷',
      level: '一星',
      idNo: '	B187875823'
  ),
  FirstMemberDataModel(
      memberID: '	DM102147',
      memberName: '關家德',
      level: '會員*',
      idNo: 'B100824164'
  ),
  FirstMemberDataModel(
      memberID: 'DM102149',
      memberName: '	王梓蓉',
      level: '會員',
      idNo: '281758833'
  ),
  FirstMemberDataModel(
      memberID: '	DM102161',
      memberName: '沈文昕',
      level: '會員*',
      idNo: 'A239570130'
  ),
];