import 'package:dm00ss/ui/default_pages/default_page/default_page.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'homepage',
          builder: (BuildContext context, GoRouterState state) {
            return const DefaultPage();
          },
        ),
        GoRoute(
          path: 'MemberQueryPage',
          builder: (BuildContext context, GoRouterState state) {
            return const MemberQueryPage();
          },
        ),
        GoRoute(
          path: 'MemberInfoPage',
          builder: (BuildContext context, GoRouterState state) {
            return const MemberInfoPage();
          },
        ),
      ],
    ),
  ],
);

enum PageName {
  FastNewsPage,
  MemberQueryPage,
  MemberInfoPage
}