import 'package:dio/dio.dart';
import 'package:dm00ss/http/api_config.dart';
import 'package:dm00ss/http/api_path.dart';

/// 存放會員相關API
class MemberRequestService {
  /// 會員資料查詢
  ///
  /// [memberId] 會員ID
  Stream<Response> queryMember(String memberId) {
    return ApiConfig.getInstance().dio.post(
      ApiPath.QueryMember,
      data: {
        "MemberID": memberId,
      },
    ).asStream();
  }
}
