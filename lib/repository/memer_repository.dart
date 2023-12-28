import 'package:dm00ss/bean/bean_converter.dart';
import 'package:dm00ss/bean/query_member/query_member_bean.dart';
import 'package:dm00ss/extension/extension.dart';
import 'package:dm00ss/http/service/member_request_service.dart';

class MemberRepository {
  static final _singleton = MemberRepository._internal();

  MemberRepository._internal();

  factory MemberRepository() => _singleton;

  static MemberRepository getInstance() => _singleton;

  final MemberRequestService _memberRequestService = MemberRequestService();

  /// 會員資料查詢
  Stream<QueryMemberBean> queryMember(String memberId) {
    return _memberRequestService
        .queryMember(memberId)
        .replaceBracket()
        .map((response) => BeanConverter.convert<QueryMemberBean>(response.data));
  }
}