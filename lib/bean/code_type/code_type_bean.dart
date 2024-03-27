import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'code_type_bean.g.dart';

@JsonSerializable()
class CodeTypeBean extends BaseResult {
  @JsonKey(name: 'result')
  List<CodeTypeResultBean>? result;

  CodeTypeBean();

  factory CodeTypeBean.fromJson(Map<String, dynamic> json) => _$CodeTypeBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CodeTypeBeanToJson(this);
}

@JsonSerializable()
class CodeTypeResultBean {
  @JsonKey(name: 'CodeId', defaultValue: "")
  String codeId;

  @JsonKey(name: 'CodeName', defaultValue: "")
  String codeName;

  CodeTypeResultBean({
    required this.codeId,
    required this.codeName,
  });

  factory CodeTypeResultBean.fromJson(Map<String, dynamic> json) => _$CodeTypeResultBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CodeTypeResultBeanToJson(this);
}
