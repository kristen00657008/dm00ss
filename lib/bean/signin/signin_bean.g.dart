// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninBean _$SigninBeanFromJson(Map<String, dynamic> json) => SigninBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?
  ..result = json['result'] == null
      ? null
      : SigninResultBean.fromJson(json['result'] as Map<String, dynamic>)
  ..userLogName = json['userLogName'] as String?;

Map<String, dynamic> _$SigninBeanToJson(SigninBean instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
      'userLogName': instance.userLogName,
    };

SigninResultBean _$SigninResultBeanFromJson(Map<String, dynamic> json) =>
    SigninResultBean(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$SigninResultBeanToJson(SigninResultBean instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
