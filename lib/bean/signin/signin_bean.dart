import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'signin_bean.g.dart';

@JsonSerializable()
class SigninBean extends BaseResult {
  @JsonKey(name: 'result')
  SigninResultBean? result;

  String? userLogName;

  SigninBean();

  factory SigninBean.fromJson(Map<String, dynamic> json) => _$SigninBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SigninBeanToJson(this);
}

@JsonSerializable()
class SigninResultBean {
  @JsonKey(name: 'accessToken', defaultValue: "")
  String accessToken;

  @JsonKey(name: 'refreshToken', defaultValue: "")
  String refreshToken;

  SigninResultBean({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SigninResultBean.fromJson(Map<String, dynamic> json) => _$SigninResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SigninResultBeanToJson(this);
}
