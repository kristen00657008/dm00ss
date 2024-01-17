import 'package:dio/dio.dart';
import 'package:dm00ss/bean/bean_converter.dart';
import 'package:dm00ss/bean/bwex/bwex_bean.dart';
import 'package:dm00ss/bean/login_org/login_org_bean.dart';
import 'package:dm00ss/bean/signin/signin_bean.dart';
import 'package:dm00ss/http/service/member_request_service.dart';

class MemberRepository {
  static final _singleton = MemberRepository._internal();

  MemberRepository._internal();

  factory MemberRepository() => _singleton;

  static MemberRepository getInstance() => _singleton;

  final MemberRequestService _memberRequestService = MemberRequestService();

  SigninBean? signinBean;

  String get userLogName => signinBean?.userLogName ?? "";

  String get accessToken => signinBean?.result?.accessToken ?? "";

  /// 會員登入
  Stream<SigninBean> signIn(String userLogName, String userPassword) {
    return _memberRequestService
        .signIn(userLogName, userPassword)
        .map((response) {
      return BeanConverter.convert<SigninBean>(response.toString());
    });
  }

  /// 會員登出
  Stream<Response> signOut() {
    return _memberRequestService
        .signOut(userLogName, accessToken);
  }

  /// 取得參數
  Stream<BWEXBean> getBWEX() {
    return _memberRequestService
        .getBWEX(accessToken)
        .map((response) {
      return BeanConverter.convert<BWEXBean>(response.toString());
    });
  }

  /// 取得使用者登入分公司
  Stream<LoginOrgBean> getLoginOrg() {
    return _memberRequestService
        .getLoginOrg(userLogName)
        .map((response) {
      return BeanConverter.convert<LoginOrgBean>(response.toString());
    });
  }
}
