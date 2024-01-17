// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult _$BaseResultFromJson(Map<String, dynamic> json) => BaseResult()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?;

Map<String, dynamic> _$BaseResultToJson(BaseResult instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
    };
