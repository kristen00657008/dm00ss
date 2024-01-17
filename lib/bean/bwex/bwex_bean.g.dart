// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bwex_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BWEXBean _$BWEXBeanFromJson(Map<String, dynamic> json) => BWEXBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?
  ..result = (json['result'] as List<dynamic>?)
      ?.map((e) => BWEXResultBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BWEXBeanToJson(BWEXBean instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

BWEXResultBean _$BWEXResultBeanFromJson(Map<String, dynamic> json) =>
    BWEXResultBean(
      bsnum: json['bsnum'] as String? ?? '',
      bsitm: json['bsitm'] as String? ?? '',
      bsnam: json['bsnam'] as String? ?? '',
      bsrmk: json['bsrmk'] as String? ?? '',
    );

Map<String, dynamic> _$BWEXResultBeanToJson(BWEXResultBean instance) =>
    <String, dynamic>{
      'bsnum': instance.bsnum,
      'bsitm': instance.bsitm,
      'bsnam': instance.bsnam,
      'bsrmk': instance.bsrmk,
    };
