// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_member_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryMemberBean _$QueryMemberBeanFromJson(Map<String, dynamic> json) {
  return QueryMemberBean(
    memberID: json['MemberID'] as String? ?? '',
    memberName: json['MemberName'] as String? ?? '',
    regionNo: json['RegionNo'] as String? ?? '',
    position: json['Position'] as String? ?? '',
    positionName: json['PositionName'] as String? ?? '',
    memberType: json['MemberType'] as String? ?? '',
    memberTypeName: json['MemberTypeName'] as String? ?? '',
    memberStatus: json['MemberStatus'] as String? ?? '',
    memberStatusName: json['MemberStatusName'] as String? ?? '',
    joinDate: json['JoinDate'] as String? ?? '',
    joinType: json['JoinType'] as String? ?? '',
    joinTypeName: json['JoinTypeName'] as String? ?? '',
    joinArea: json['JoinArea'] as String? ?? '',
    joinAreaName: json['JoinAreaName'] as String? ?? '',
    idNo: json['IdNo'] as String? ?? '',
    companyNames: json['CompanyNames'] as String? ?? '',
    companyIdNo: json['CompanyIdNo'] as String? ?? '',
    contactPerson: json['ContactPerson'] as String? ?? '',
    companyDate: json['CompanyDate'] as String? ?? '',
    parentMemberID: json['ParentMemberID'] as String? ?? '',
    parentMemberName: json['ParentMemberName'] as String? ?? '',
    leftRight: json['LeftRight'] as String? ?? '',
    leftRightName: json['LeftRightName'] as String? ?? '',
    recommendMemberID: json['RecommendMemberID'] as String? ?? '',
    recommendMemberName: json['RecommendMemberName'] as String? ?? '',
    birthday: json['Birthday'] as String? ?? '',
    sex: json['Sex'] as String? ?? '',
    emailAddress: json['EmailAddress'] as String? ?? '',
    phoneNo: json['PhoneNo'] as String? ?? '',
    orgPhoneNo: json['OrgPhoneNo'] as String? ?? '',
    faxNo: json['FaxNo'] as String? ?? '',
    mobileNo: json['MobileNo'] as String? ?? '',
    mobileNo2: json['MobileNo2'] as String? ?? '',
    legalAgent: json['LegalAgent'] as String? ?? '',
    memberRelation: json['MemberRelation'] as String? ?? '',
    curZipCode: json['CurZipCode'] as String? ?? '',
    curCity: json['CurCity'] as String? ?? '',
    curTown: json['CurTown'] as String? ?? '',
    curNeighbor: json['CurNeighbor'] as String? ?? '',
    curRoad: json['CurRoad'] as String? ?? '',
    curAddress: json['CurAddress'] as String? ?? '',
    curCountry: json['CurCountry'] as String? ?? '',
    password: json['Password'] as String? ?? '',
    bankNo: json['BankNo'] as String? ?? '',
    bankName: json['BankName'] as String? ?? '',
    bankBranch: json['BankBranch'] as String? ?? '',
    bankBranchName: json['BankBranchName'] as String? ?? '',
    bankAccount: json['BankAccount'] as String? ?? '',
    flagSet: json['FlagSet'] as String? ?? '',
    accountName: json['AccountName'] as String? ?? '',
    accountIdNo: json['AccountIdNo'] as String? ?? '',
    createUser: json['CreateUser'] as String? ?? '',
    accountPWD: json['ACCOUNT_PWD'] as String? ?? '',
    royaltyFlag: json['RoyaltyFlag'] as String? ?? '',
    userLogName: json['UserLogName'] as String? ?? '',
    orderFlag: json['OrderFlag'] as String? ?? '',
    approveStatus: json['ApproveStatus'] as String? ?? '',
    approveStatusName: json['ApproveStatusName'] as String? ?? '',
  )
    ..result = json['Result'] as num? ?? -1
    ..resultDesc = json['ResultDesc'] as String? ?? ''
    ..resultCode = json['ResultCode'] as String? ?? '';
}

Map<String, dynamic> _$QueryMemberBeanToJson(QueryMemberBean instance) =>
    <String, dynamic>{
      'Result': instance.result,
      'ResultDesc': instance.resultDesc,
      'ResultCode': instance.resultCode,
      'MemberID': instance.memberID,
      'MemberName': instance.memberName,
      'RegionNo': instance.regionNo,
      'Position': instance.position,
      'PositionName': instance.positionName,
      'MemberType': instance.memberType,
      'MemberTypeName': instance.memberTypeName,
      'MemberStatus': instance.memberStatus,
      'MemberStatusName': instance.memberStatusName,
      'JoinDate': instance.joinDate,
      'JoinType': instance.joinType,
      'JoinTypeName': instance.joinTypeName,
      'JoinArea': instance.joinArea,
      'JoinAreaName': instance.joinAreaName,
      'IdNo': instance.idNo,
      'CompanyNames': instance.companyNames,
      'CompanyIdNo': instance.companyIdNo,
      'ContactPerson': instance.contactPerson,
      'CompanyDate': instance.companyDate,
      'ParentMemberID': instance.parentMemberID,
      'ParentMemberName': instance.parentMemberName,
      'LeftRight': instance.leftRight,
      'LeftRightName': instance.leftRightName,
      'RecommendMemberID': instance.recommendMemberID,
      'RecommendMemberName': instance.recommendMemberName,
      'Birthday': instance.birthday,
      'Sex': instance.sex,
      'EmailAddress': instance.emailAddress,
      'PhoneNo': instance.phoneNo,
      'OrgPhoneNo': instance.orgPhoneNo,
      'FaxNo': instance.faxNo,
      'MobileNo': instance.mobileNo,
      'MobileNo2': instance.mobileNo2,
      'LegalAgent': instance.legalAgent,
      'MemberRelation': instance.memberRelation,
      'CurZipCode': instance.curZipCode,
      'CurCity': instance.curCity,
      'CurTown': instance.curTown,
      'CurNeighbor': instance.curNeighbor,
      'CurRoad': instance.curRoad,
      'CurAddress': instance.curAddress,
      'CurCountry': instance.curCountry,
      'Password': instance.password,
      'BankNo': instance.bankNo,
      'BankName': instance.bankName,
      'BankBranch': instance.bankBranch,
      'BankBranchName': instance.bankBranchName,
      'BankAccount': instance.bankAccount,
      'FlagSet': instance.flagSet,
      'AccountName': instance.accountName,
      'AccountIdNo': instance.accountIdNo,
      'CreateUser': instance.createUser,
      'ACCOUNT_PWD': instance.accountPWD,
      'RoyaltyFlag': instance.royaltyFlag,
      'UserLogName': instance.userLogName,
      'OrderFlag': instance.orderFlag,
      'ApproveStatus': instance.approveStatus,
      'ApproveStatusName': instance.approveStatusName,
    };
