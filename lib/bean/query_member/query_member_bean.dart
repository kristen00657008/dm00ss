import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'query_member_bean.g.dart';

@JsonSerializable()
class QueryMemberBean extends BaseResult {
  @JsonKey(name: 'MemberID', defaultValue: "")
  String memberID;

  @JsonKey(name: 'MemberName', defaultValue: "")
  String memberName;

  @JsonKey(name: 'RegionNo', defaultValue: "")
  String regionNo;

  @JsonKey(name: 'Position', defaultValue: "")
  String position;

  @JsonKey(name: 'PositionName', defaultValue: "")
  String positionName;

  @JsonKey(name: 'MemberType', defaultValue: "")
  String memberType;

  @JsonKey(name: 'MemberTypeName', defaultValue: "")
  String memberTypeName;

  @JsonKey(name: 'MemberStatus', defaultValue: "")
  String memberStatus;

  @JsonKey(name: 'MemberStatusName', defaultValue: "")
  String memberStatusName;

  @JsonKey(name: 'JoinDate', defaultValue: "")
  String joinDate;

  @JsonKey(name: 'JoinType', defaultValue: "")
  String joinType;

  @JsonKey(name: 'JoinTypeName', defaultValue: "")
  String joinTypeName;

  @JsonKey(name: 'JoinArea', defaultValue: "")
  String joinArea;

  @JsonKey(name: 'JoinAreaName', defaultValue: "")
  String joinAreaName;

  @JsonKey(name: 'IdNo', defaultValue: "")
  String idNo;

  @JsonKey(name: 'CompanyNames', defaultValue: "")
  String companyNames;

  @JsonKey(name: 'CompanyIdNo', defaultValue: "")
  String companyIdNo;

  @JsonKey(name: 'ContactPerson', defaultValue: "")
  String contactPerson;

  @JsonKey(name: 'CompanyDate', defaultValue: "")
  String companyDate;

  @JsonKey(name: 'ParentMemberID', defaultValue: "")
  String parentMemberID;

  @JsonKey(name: 'ParentMemberName', defaultValue: "")
  String parentMemberName;

  @JsonKey(name: 'LeftRight', defaultValue: "")
  String leftRight;

  @JsonKey(name: 'LeftRightName', defaultValue: "")
  String leftRightName;

  @JsonKey(name: 'RecommendMemberID', defaultValue: "")
  String recommendMemberID;

  @JsonKey(name: 'RecommendMemberName', defaultValue: "")
  String recommendMemberName;

  @JsonKey(name: 'Birthday', defaultValue: "")
  String birthday;

  @JsonKey(name: 'Sex', defaultValue: "")
  String sex;

  @JsonKey(name: 'EmailAddress', defaultValue: "")
  String emailAddress;

  @JsonKey(name: 'PhoneNo', defaultValue: "")
  String phoneNo;

  @JsonKey(name: 'OrgPhoneNo', defaultValue: "")
  String orgPhoneNo;

  @JsonKey(name: 'FaxNo', defaultValue: "")
  String faxNo;

  @JsonKey(name: 'MobileNo', defaultValue: "")
  String mobileNo;

  @JsonKey(name: 'MobileNo2', defaultValue: "")
  String mobileNo2;

  @JsonKey(name: 'LegalAgent', defaultValue: "")
  String legalAgent;

  @JsonKey(name: 'MemberRelation', defaultValue: "")
  String memberRelation;

  @JsonKey(name: 'CurZipCode', defaultValue: "")
  String curZipCode;

  @JsonKey(name: 'CurCity', defaultValue: "")
  String curCity;

  @JsonKey(name: 'CurTown', defaultValue: "")
  String curTown;

  @JsonKey(name: 'CurNeighbor', defaultValue: "")
  String curNeighbor;

  @JsonKey(name: 'CurRoad', defaultValue: "")
  String curRoad;

  @JsonKey(name: 'CurAddress', defaultValue: "")
  String curAddress;

  @JsonKey(name: 'CurCountry', defaultValue: "")
  String curCountry;

  @JsonKey(name: 'Password', defaultValue: "")
  String password;

  @JsonKey(name: 'BankNo', defaultValue: "")
  String bankNo;

  @JsonKey(name: 'BankName', defaultValue: "")
  String bankName;

  @JsonKey(name: 'BankBranch', defaultValue: "")
  String bankBranch;

  @JsonKey(name: 'BankBranchName', defaultValue: "")
  String bankBranchName;

  @JsonKey(name: 'BankAccount', defaultValue: "")
  String bankAccount;

  @JsonKey(name: 'FlagSet', defaultValue: "")
  String flagSet;

  @JsonKey(name: 'AccountName', defaultValue: "")
  String accountName;

  @JsonKey(name: 'AccountIdNo', defaultValue: "")
  String accountIdNo;

  @JsonKey(name: 'CreateUser', defaultValue: "")
  String createUser;

  @JsonKey(name: 'ACCOUNT_PWD', defaultValue: "")
  String accountPWD;

  @JsonKey(name: 'RoyaltyFlag', defaultValue: "")
  String royaltyFlag;

  @JsonKey(name: 'UserLogName', defaultValue: "")
  String userLogName;

  @JsonKey(name: 'OrderFlag', defaultValue: "")
  String orderFlag;

  @JsonKey(name: 'ApproveStatus', defaultValue: "")
  String approveStatus;

  @JsonKey(name: 'ApproveStatusName', defaultValue: "")
  String approveStatusName;

  QueryMemberBean({
    required this.memberID,
    required this.memberName,
    required this.regionNo,
    required this.position,
    required this.positionName,
    required this.memberType,
    required this.memberTypeName,
    required this.memberStatus,
    required this.memberStatusName,
    required this.joinDate,
    required this.joinType,
    required this.joinTypeName,
    required this.joinArea,
    required this.joinAreaName,
    required this.idNo,
    required this.companyNames,
    required this.companyIdNo,
    required this.contactPerson,
    required this.companyDate,
    required this.parentMemberID,
    required this.parentMemberName,
    required this.leftRight,
    required this.leftRightName,
    required this.recommendMemberID,
    required this.recommendMemberName,
    required this.birthday,
    required this.sex,
    required this.emailAddress,
    required this.phoneNo,
    required this.orgPhoneNo,
    required this.faxNo,
    required this.mobileNo,
    required this.mobileNo2,
    required this.legalAgent,
    required this.memberRelation,
    required this.curZipCode,
    required this.curCity,
    required this.curTown,
    required this.curNeighbor,
    required this.curRoad,
    required this.curAddress,
    required this.curCountry,
    required this.password,
    required this.bankNo,
    required this.bankName,
    required this.bankBranch,
    required this.bankBranchName,
    required this.bankAccount,
    required this.flagSet,
    required this.accountName,
    required this.accountIdNo,
    required this.createUser,
    required this.accountPWD,
    required this.royaltyFlag,
    required this.userLogName,
    required this.orderFlag,
    required this.approveStatus,
    required this.approveStatusName,
  });

  factory QueryMemberBean.fromJson(Map<String, dynamic> json) => _$QueryMemberBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QueryMemberBeanToJson(this);
}
