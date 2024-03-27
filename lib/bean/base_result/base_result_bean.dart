import 'package:dm00ss/bean/base/base_result.dart';
import 'package:json_annotation/json_annotation.dart';

import '../error/error_bean.dart';

part 'base_result_bean.g.dart';

@JsonSerializable()
class BaseResultBean extends BaseResult {
  @JsonKey(name: 'result')
  MessageResultBean? result;

  BaseResultBean();

  factory BaseResultBean.fromJson(Map<String, dynamic> json) => _$BaseResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResultBeanToJson(this);
}


@JsonSerializable()
class MessageResultBean {
  @JsonKey(name: 'Message', defaultValue: "")
  String message;

  MessageResultBean({
    required this.message,
  });

  factory MessageResultBean.fromJson(Map<String, dynamic> json) => _$MessageResultBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResultBeanToJson(this);
}
