import 'dart:convert';

import 'package:dio/dio.dart';

import 'aes_format.dart';

class DioInterceptor extends Interceptor {
  final DioInterceptorBuilder _builder;

  DioInterceptor._(this._builder);

  /// 請求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// 要傳出去的參數
    Map<String, dynamic> paramMap = _convertRequestParam(options);

    /// 要傳出去的標頭
    Map<String, dynamic> headerMap = _convertHeaderParam(options);

    print("❤️➡️${options.baseUrl + options.path}  ${json.encode(paramMap)}");
    options.data = {"": AesFormat.encrypt(json.encode(paramMap))};
    options.headers = headerMap;

    super.onRequest(options, handler);
  }

  /// API回應
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      String responseJson = AesFormat.decrypt(response.data);
      print("⬅️⬅️${response.requestOptions.baseUrl}${response.requestOptions.path}  $responseJson");
      response.data = responseJson;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ddd ===============================');

    String json = '';
    if (err.requestOptions.data is Map) {
      json = AesFormat.decrypt(err.requestOptions.data[''].toString());
    }
    print(
      'ddd DioError ${err.requestOptions.baseUrl}${err.requestOptions.path} $json',
    );
    if (err.response.toString().isNotEmpty) {
      print('ddd DioError ${err.response?.statusCode} ${err.response.toString()}');
    } else {
      print('ddd DioError ${err.response?.statusCode} ${err.error}');
    }
    print('ddd ===============================');
    super.onError(err, handler);
  }

  /// 處理公用參數
  Map<String, dynamic> _convertRequestParam(RequestOptions options) {
    /// 要傳出去的參數
    Map<String, dynamic> paramMap = {};

    /// 使用者傳出參數
    Map<String, dynamic> optionsData = options.data ?? {};

    /// 先加入公用參數，避免傳出參數被公用參數覆蓋
    paramMap.addAll(_builder._requestParam);

    /// 加入傳出參數
    optionsData.forEach((key, value) => paramMap[key] = value);

    return paramMap;
  }

  /// 處理公用標頭
  Map<String, dynamic> _convertHeaderParam(RequestOptions options) {
    /// 要傳出去的標頭
    Map<String, dynamic> headerMap = {};

    /// 使用者傳出標頭
    Map<String, dynamic> optionsData = options.headers;

    /// 先加入公用標頭，避免傳出標頭被公用標頭覆蓋
    headerMap.addAll(_builder._requestParam);

    /// 加入傳出標頭
    optionsData.forEach((key, value) => headerMap[key] = value);

    return headerMap;
  }
}

class DioInterceptorBuilder {
  /// 公共參數
  final Map<String, String> _requestParam = Map();

  /// header參數
  final Map<String, String> _headerParam = Map();

  /// 新增公共參數
  DioInterceptorBuilder addCommonRequestParam(String key, String value) {
    _requestParam[key] = value;
    return this;
  }

  /// 新增公共參數
  DioInterceptorBuilder addHeaderRequestParam(String key, String value) {
    _headerParam[key] = value;
    return this;
  }

  DioInterceptor build() {
    return DioInterceptor._(this);
  }
}
