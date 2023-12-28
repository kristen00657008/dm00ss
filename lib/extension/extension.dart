import 'dart:convert';

import 'package:dio/dio.dart';

/// 發現有部分API回傳是包含在JsonArray內一層，調用此方法刪除[]
/// 原Android標準版是在Interceptor過濾
/// ex:GetCustBusiness
extension StreamBracket on Stream<Response> {
  Stream<Response> replaceBracket() => map((response) {
    var a = (jsonDecode(response.data) as List).toList();
    String responseJson = response.data;

    if (a.length == 1) {
      responseJson = responseJson.replaceFirst("[", "");
      responseJson = responseJson.replaceFirst("]", "", responseJson.length - 1);
      response.data = responseJson;
    }

    return response;
  });
}