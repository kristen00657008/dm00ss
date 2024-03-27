import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'menu_bean.g.dart';

@JsonSerializable()
class MenuBean extends BaseResult {
  @JsonKey(name: 'result')
  List<MenuResultBean>? result;

  MenuBean();

  factory MenuBean.fromJson(Map<String, dynamic> json) => _$MenuBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuBeanToJson(this);
}

@JsonSerializable()
class MenuResultBean {
  @JsonKey(name: 'ParentNodeId', defaultValue: "")
  String parentNodeId;

  @JsonKey(name: 'NodeId', defaultValue: "")
  String nodeId;

  @JsonKey(name: 'FunctionName', defaultValue: "")
  String functionName;

  @JsonKey(name: 'NodeUrl', defaultValue: "")
  String nodeUrl;

  MenuResultBean({
    required this.parentNodeId,
    required this.nodeId,
    required this.functionName,
    required this.nodeUrl,
  });

  factory MenuResultBean.fromJson(Map<String, dynamic> json) => _$MenuResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuResultBeanToJson(this);
}
