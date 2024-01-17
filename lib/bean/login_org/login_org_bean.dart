import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'login_org_bean.g.dart';

@JsonSerializable()
class LoginOrgBean extends BaseResult {
  @JsonKey(name: 'result')
  List<LoginOrgResultBean>? result;

  LoginOrgBean();

  factory LoginOrgBean.fromJson(Map<String, dynamic> json) => _$LoginOrgBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginOrgBeanToJson(this);
}

@JsonSerializable()
class LoginOrgResultBean {
  @JsonKey(name: 'companyNames', defaultValue: "")
  String companyNames;

  @JsonKey(name: 'orgNo', defaultValue: "")
  String orgNo;

  LoginOrgResultBean({
    required this.companyNames,
    required this.orgNo,
  });

  factory LoginOrgResultBean.fromJson(Map<String, dynamic> json) => _$LoginOrgResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginOrgResultBeanToJson(this);
}
