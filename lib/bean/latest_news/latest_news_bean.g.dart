// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestNewsBean _$LatestNewsBeanFromJson(Map<String, dynamic> json) =>
    LatestNewsBean()
      ..statusCode = json['statusCode'] as int?
      ..error = json['error'] == null
          ? null
          : ErrorResultBean.fromJson(json['error'] as Map<String, dynamic>)
      ..requestId = json['requestId'] as String?
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => LatestNewsResultBean.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LatestNewsBeanToJson(LatestNewsBean instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'requestId': instance.requestId,
      'result': instance.result,
    };

LatestNewsResultBean _$LatestNewsResultBeanFromJson(
        Map<String, dynamic> json) =>
    LatestNewsResultBean(
      wNo: json['wNo'] as int? ?? 0,
      postDate: json['PostDate'] as String? ?? '',
      caption: json['Caption'] as String? ?? '',
      content: json['Content'] as String? ?? '',
      fileUrl: json['FileUrl'] as String? ?? '',
      userName: json['UserName'] as String? ?? '',
    );

Map<String, dynamic> _$LatestNewsResultBeanToJson(
        LatestNewsResultBean instance) =>
    <String, dynamic>{
      'wNo': instance.wNo,
      'PostDate': instance.postDate,
      'Caption': instance.caption,
      'Content': instance.content,
      'FileUrl': instance.fileUrl,
      'UserName': instance.userName,
    };
