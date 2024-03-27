// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuBean _$MenuBeanFromJson(Map<String, dynamic> json) => MenuBean()
  ..statusCode = json['statusCode'] as int?
  ..error = json['error'] == null
      ? null
      : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
  ..requestId = json['requestId'] as String?
  ..result = (json['result'] as List<dynamic>?)
      ?.map((e) => MenuResultBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$MenuBeanToJson(MenuBean instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

MenuResultBean _$MenuResultBeanFromJson(Map<String, dynamic> json) =>
    MenuResultBean(
      parentNodeId: json['ParentNodeId'] as String? ?? '',
      nodeId: json['NodeId'] as String? ?? '',
      functionName: json['FunctionName'] as String? ?? '',
      nodeUrl: json['NodeUrl'] as String? ?? '',
    );

Map<String, dynamic> _$MenuResultBeanToJson(MenuResultBean instance) =>
    <String, dynamic>{
      'ParentNodeId': instance.parentNodeId,
      'NodeId': instance.nodeId,
      'FunctionName': instance.functionName,
      'NodeUrl': instance.nodeUrl,
    };
