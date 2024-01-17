import 'package:dio/dio.dart';
import 'package:dm00ss/http/dio/dio_interceptor.dart';

class ApiConfig {
  static final _singleton = ApiConfig._internal();

  ApiConfig._internal();

  factory ApiConfig() => _singleton;

  static ApiConfig getInstance() => _singleton;

  /// 網路實體
  late Dio _dio;
  Dio get dio => _dio;

  /// API路徑
  final _serverApiIP = "http://192.168.40.12/ML00NC_WebAPI";

  /// 專案名稱
  final _projectId = "ML00NC";

  /// 語系
  final _cultureInfo = "zh-TW";

  /// 來源
  final source = "99";

  /// 初始化Dio
  void initDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "$_serverApiIP/api/$_cultureInfo/",
      connectTimeout: const Duration(seconds: 60),
      contentType: "application/json",
    ));

    /// 新增共用參數
    DioInterceptor interceptor = DioInterceptorBuilder().build();

    _dio.interceptors.add(interceptor);
  }
}