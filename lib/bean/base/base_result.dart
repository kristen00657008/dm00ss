import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_result.g.dart';

@JsonSerializable()
class BaseResult {
  @JsonKey(name: 'statusCode')
  int? statusCode;

  @JsonKey(name: 'error')
  ErrorResultBean? error;

  @JsonKey(name: 'requestId')
  String? requestId;

  BaseResult();

  factory BaseResult.fromJson(Map<String, dynamic> json) => _$BaseResultFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResultToJson(this);
}
