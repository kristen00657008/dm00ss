// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResultBean _$BaseResultBeanFromJson(Map<String, dynamic> json) =>
    BaseResultBean()
      ..statusCode = json['statusCode'] as int?
      ..error = json['error'] == null
          ? null
          : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
      ..requestId = json['requestId'] as String?
      ..result = json['result'] == null
          ? null
          : MessageResultBean.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResultBeanToJson(BaseResultBean instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

MessageResultBean _$MessageResultBeanFromJson(Map<String, dynamic> json) =>
    MessageResultBean(
      message: json['Message'] as String? ?? '',
    );

Map<String, dynamic> _$MessageResultBeanToJson(MessageResultBean instance) =>
    <String, dynamic>{
      'Message': instance.message,
    };
