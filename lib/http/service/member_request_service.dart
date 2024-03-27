import 'package:dio/dio.dart';
import 'package:dm00ss/http/api_config.dart';
import 'package:dm00ss/http/api_path.dart';

/// 存放會員相關API
class MemberRequestService {
  /// 會員登入
  ///
  /// [userLogName] 會員帳號
  /// [userPassword] 會員密碼
  Stream<Response> signIn(String userLogName, String userPassword) {
    return ApiConfig.getInstance().dio.post(
      ApiPath.Signin,
      data: {
        "userLogName": userLogName,
        "userPassword": userPassword,
        "orgNo": "01",
      },
    ).asStream();
  }

  /// 會員登出
  ///
  /// [userLogName] 會員帳號
  /// [accessToken] 訪問令牌
  Stream<Response> signOut(String userLogName, String accessToken) {
    return ApiConfig.getInstance().dio.post(
      ApiPath.Signout,
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
      data: {
        "userLogName": userLogName,
        "accesstoken": accessToken,
      },
    ).asStream();
  }

  /// 取得參數
  ///
  /// [memberId] 會員ID
  Stream<Response> getBWEX(String accessToken) {
    return ApiConfig.getInstance()
        .dio
        .get(
          ApiPath.BWEX,
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        )
        .asStream();
  }

  /// 取得使用者登入分公司
  ///
  /// [memberId] 會員ID
  Stream<Response> getLoginOrg(String userLogName) {
    return ApiConfig.getInstance()
        .dio
        .get(
          "${ApiPath.LoginOrg}/$userLogName",
        )
        .asStream();
  }

  /// 忘記密碼寄送
  ///
  /// [userLogName] 會員帳號
  Stream<Response> userPasswordMail(String userLogName) {
    return ApiConfig.getInstance().dio.post(
      ApiPath.userPasswordMail,
      data: {
        "UserLogName": userLogName,
      },
    ).asStream();
  }

  /// 使用者密碼修改
  ///
  /// [userLogName] 會員帳號
  /// [oldUserPassword]
  /// [newUserPassword]
  Stream<Response> userPasswordModify(
    String userLogName,
    String oldUserPassword,
    String newUserPassword,
    String accessToken,
  ) {
    return ApiConfig.getInstance().dio.post(
      ApiPath.userPasswordModify,
      data: {
        "UserLogName": userLogName,
        "OldUserPassword": oldUserPassword,
        "NewUserPassword": newUserPassword,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    ).asStream();
  }
}
