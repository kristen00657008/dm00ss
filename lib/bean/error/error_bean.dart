import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'error_bean.g.dart';

@JsonSerializable()
class ErrorBean extends BaseResult {
  ErrorBean();

  factory ErrorBean.fromJson(Map<String, dynamic> json) =>
      _$ErrorBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorBeanToJson(this);
}

@JsonSerializable()
class ErrorResultBean {
  @JsonKey(name: 'code', defaultValue: "")
  String code;

  @JsonKey(name: 'message', defaultValue: "")
  String message;

  @JsonKey(name: 'details')
  Map<String, dynamic>? details;

  ErrorResultBean({
    required this.code,
    required this.message,
    required this.details,
  });

  factory ErrorResultBean.fromJson(Map<String, dynamic> json) => _$ErrorResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorResultBeanToJson(this);
}
