// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorBean _$ErrorBeanFromJson(Map<String, dynamic> json) => ErrorBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?;

Map<String, dynamic> _$ErrorBeanToJson(ErrorBean instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
    };

ErrorResultBean _$ErrorResultBeanFromJson(Map<String, dynamic> json) =>
    ErrorResultBean(
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ErrorResultBeanToJson(ErrorResultBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };
