import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'bwex_bean.g.dart';

@JsonSerializable()
class BWEXBean extends BaseResult {
  @JsonKey(name: 'result')
  List<BWEXResultBean>? result;

  BWEXBean();

  factory BWEXBean.fromJson(Map<String, dynamic> json) => _$BWEXBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BWEXBeanToJson(this);
}

@JsonSerializable()
class BWEXResultBean {
  @JsonKey(name: 'bsnum', defaultValue: "")
  String bsnum;

  @JsonKey(name: 'bsitm', defaultValue: "")
  String bsitm;

  @JsonKey(name: 'bsnam', defaultValue: "")
  String bsnam;

  @JsonKey(name: 'bsrmk', defaultValue: "")
  String bsrmk;

  BWEXResultBean({
    required this.bsnum,
    required this.bsitm,
    required this.bsnam,
    required this.bsrmk,
  });

  factory BWEXResultBean.fromJson(Map<String, dynamic> json) => _$BWEXResultBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BWEXResultBeanToJson(this);
}
