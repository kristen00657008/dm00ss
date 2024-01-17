// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_org_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOrgBean _$LoginOrgBeanFromJson(Map<String, dynamic> json) => LoginOrgBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?
  ..result = (json['result'] as List<dynamic>?)
      ?.map((e) => LoginOrgResultBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$LoginOrgBeanToJson(LoginOrgBean instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

LoginOrgResultBean _$LoginOrgResultBeanFromJson(Map<String, dynamic> json) =>
    LoginOrgResultBean(
      companyNames: json['companyNames'] as String? ?? '',
      orgNo: json['orgNo'] as String? ?? '',
    );

Map<String, dynamic> _$LoginOrgResultBeanToJson(LoginOrgResultBean instance) =>
    <String, dynamic>{
      'companyNames': instance.companyNames,
      'orgNo': instance.orgNo,
    };
