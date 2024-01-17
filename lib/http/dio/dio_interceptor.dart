import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dm00ss/bean/base/base_result.dart';
import 'package:dm00ss/bean/bean_converter.dart';
import 'package:dm00ss/bean/error/error_bean.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor._();

  /// 請求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// 要傳出去的參數
    Map<String, dynamic> paramMap = options.data ?? {};

    /// 要傳出去的標頭
    Map<String, dynamic> headerMap = options.headers;

    print("❤️➡️${options.baseUrl + options.path}  ${json.encode(paramMap)}");
    options.data = paramMap;
    options.headers = headerMap;

    super.onRequest(options, handler);
  }

  /// API回應
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      print(
          "⬅️⬅️${response.requestOptions.baseUrl}${response.requestOptions.path} ${response.data}");
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response.toString().isNotEmpty) {
      print('❌❌❎ ${err.requestOptions.uri} ${err.response}');
      BaseResult baseResult =
          BeanConverter.convert<BaseResult>(err.response.toString());
      handler.next(DioException(
        requestOptions: err.requestOptions,
        stackTrace: err.stackTrace,
        error: baseResult
      ));
      return;
    } else {
      print('❌❌ ${err.response?.statusCode} ${err.error}');
    }
    super.onError(err, handler);
  }
}

class DioInterceptorBuilder {
  DioInterceptor build() {
    return DioInterceptor._();
  }
}
