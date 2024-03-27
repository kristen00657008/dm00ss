// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_type_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeTypeBean _$CodeTypeBeanFromJson(Map<String, dynamic> json) => CodeTypeBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?
  ..result = (json['result'] as List<dynamic>?)
      ?.map((e) => CodeTypeResultBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CodeTypeBeanToJson(CodeTypeBean instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

CodeTypeResultBean _$CodeTypeResultBeanFromJson(Map<String, dynamic> json) =>
    CodeTypeResultBean(
      codeId: json['CodeId'] as String? ?? '',
      codeName: json['CodeName'] as String? ?? '',
    );

Map<String, dynamic> _$CodeTypeResultBeanToJson(CodeTypeResultBean instance) =>
    <String, dynamic>{
      'CodeId': instance.codeId,
      'CodeName': instance.codeName,
    };
