import 'package:dm00ss/bean/error/error_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base/base_result.dart';

part 'latest_news_bean.g.dart';

@JsonSerializable()
class LatestNewsBean extends BaseResult {
  @JsonKey(name: 'result')
  List<LatestNewsResultBean>? result;

  LatestNewsBean();

  factory LatestNewsBean.fromJson(Map<String, dynamic> json) => _$LatestNewsBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LatestNewsBeanToJson(this);
}

@JsonSerializable()
class LatestNewsResultBean {
  @JsonKey(name: 'wNo', defaultValue: 0)
  int wNo;

  @JsonKey(name: 'PostDate', defaultValue: "")
  String postDate;

  @JsonKey(name: 'Caption', defaultValue: "")
  String caption;

  @JsonKey(name: 'Content', defaultValue: "")
  String content;

  @JsonKey(name: 'FileUrl', defaultValue: "")
  String fileUrl;

  @JsonKey(name: 'UserName', defaultValue: "")
  String userName;

  LatestNewsResultBean({
    required this.wNo,
    required this.postDate,
    required this.caption,
    required this.content,
    required this.fileUrl,
    required this.userName,
  });

  factory LatestNewsResultBean.fromJson(Map<String, dynamic> json) => _$LatestNewsResultBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LatestNewsResultBeanToJson(this);
}
