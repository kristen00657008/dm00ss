import 'package:dio/dio.dart';
import 'package:dm00ss/http/api_config.dart';
import 'package:dm00ss/http/api_path.dart';

/// 存放其他相關API
class AppRequestService {
  /// 代碼檔查詢
  ///
  /// [codeType] 代碼檔類別
  Stream<Response> getCodeType(
    String codeType,
    String accessToken,
  ) {
    return ApiConfig.getInstance()
        .dio
        .get(
          "${ApiPath.codeType}/$codeType",
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        )
        .asStream();
  }

  /// 取得目錄
  ///
  ///
  Stream<Response> getMenu(
    String accessToken,
  ) {
    return ApiConfig.getInstance()
        .dio
        .get(
          ApiPath.menu,
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        )
        .asStream();
  }

  /// 取得最新消息
  ///
  ///
  Stream<Response> getLatestNews(
      String accessToken,
      ) {
    return ApiConfig.getInstance()
        .dio
        .get(
      ApiPath.latestNews,
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    )
        .asStream();
  }

}
