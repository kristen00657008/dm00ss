import 'package:json_annotation/json_annotation.dart';

part 'base_result.g.dart';

@JsonSerializable()
class BaseResult {
  @JsonKey(name: 'Result', defaultValue: -1)
  num result = -1;
  @JsonKey(name: 'ResultDesc', defaultValue: "")
  String resultDesc = "";
  @JsonKey(name: 'ResultCode', defaultValue: "")
  String resultCode = "";

  BaseResult();

  factory BaseResult.fromJson(Map<String, dynamic> json) => _$BaseResultFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResultToJson(this);

  bool get isSuccess => result == 1;
}
