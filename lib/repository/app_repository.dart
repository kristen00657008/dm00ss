import 'package:dm00ss/bean/bean_converter.dart';
import 'package:dm00ss/bean/code_type/code_type_bean.dart';
import 'package:dm00ss/http/service/app_request_service.dart';

class AppRepository {
  static final _singleton = AppRepository._internal();

  AppRepository._internal();

  factory AppRepository() => _singleton;

  static AppRepository getInstance() => _singleton;

  final AppRequestService _appRequestService = AppRequestService();

}
