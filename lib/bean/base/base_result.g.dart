// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult _$BaseResultFromJson(Map<String, dynamic> json) {
  return BaseResult()
    ..result = json['Result'] as num? ?? -1
    ..resultDesc = json['ResultDesc'] as String? ?? ''
    ..resultCode = json['ResultCode'] as String? ?? '';
}

Map<String, dynamic> _$BaseResultToJson(BaseResult instance) =>
    <String, dynamic>{
      'Result': instance.result,
      'ResultDesc': instance.resultDesc,
      'ResultCode': instance.resultCode,
    };
