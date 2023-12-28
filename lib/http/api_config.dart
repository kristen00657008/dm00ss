import 'package:dio/dio.dart';
import 'package:dm00ss/http/dio/dio_interceptor.dart';

class ApiConfig {
  static final _singleton = ApiConfig._internal();

  ApiConfig._internal();

  factory ApiConfig() => _singleton;

  static ApiConfig getInstance() => _singleton;

  static const aesKey = "Zoor39rbijL0xbiF";

  /// 網路實體
  late Dio _dio;

  Dio get dio => _dio;

  /// API路徑
  final _serverApiIP = "http://192.168.40.44/";

  /// 專案名稱
  final _projectId = "ML01SS";

  /// 請求header
  final _headerProjectId = "DM01SSV4";

  /// 語系
  final _lang = "zh-TW";

  /// 地區
  final _regionNo = "01";

  /// 來源
  final source = "99";

  /// 初始化Dio
  void initDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "$_serverApiIP${_projectId}_WebApi/api/",
      headers: {"x-Authority-Identity": _headerProjectId},
      connectTimeout: const Duration(seconds: 60),
      contentType: "application/x-www-form-urlencoded;charset=UTF-8",
    ));

    /// 新增共用參數
    DioInterceptor interceptor = DioInterceptorBuilder()
        .addCommonRequestParam("RegionNo", _regionNo)
        .addCommonRequestParam("Lang", _lang)
        .addCommonRequestParam("Source", source)
        .build();

    _dio.interceptors.add(interceptor);
  }

}